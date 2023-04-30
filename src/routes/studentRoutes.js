const express = require("express");
const router = new express.Router();
const {
    checkAuthenticated,
    checkNotAuthenticated,
    checkIsTeacher,
    checkIsNotTeacher
} = require("../utils/middleware");
const path = require("path");
const connection = require("../utils/dbconnection");
const { exitCode } = require("process");

router.get("/", [checkAuthenticated, checkIsNotTeacher], (req, res) => {
    res.render("index", {
        user: req.user
    });
})
router.get("/student_profile", [checkAuthenticated, checkIsTeacher], (req, res) => {
    student = req.query.student;
    team = req.query.team;
    console.log("team", team);
    res.render("student_profile", {
        student,
        team
    });
})

router.get("/teams", [checkAuthenticated], (req, res) => {
    if (req.user.status == "teacher") {
        teacher = true;
        const sql = "SELECT * FROM `teaches_on` WHERE `email` LIKE '" + req.user.email + "'";
        try {
            connection.query(sql, (err, rows) => {
                // console.log("rows inside tr", rows)
                if (err) {
                    console.log("error", err);
                } else {
                    return res.render("teams", {
                        teacher,
                        rows,
                    })
                }
            })
        } catch (e) {
            console.log(e);
            return res.redirect("/");
        }
    }
    else {
        const sql = "SELECT * FROM `study_on` WHERE `member` LIKE '" + req.user.email + "'";
        try {
            connection.query(sql, (err, rows) => {
                // console.log("rows inside st", rows)
                if (err) {
                    console.log("error", err);
                } else {
                    return res.render("teams", {
                        rows,
                    })
                }
            })
        } catch (e) {
            console.log(e);
            res.redirect("/");
        }
    }
})

router.get("/team-info", [checkAuthenticated], async (req, res) => {
    teamname = req.query.team_name
    // console.log(teamname);
    teacher = false;
    if (req.user.status == "teacher") {
        teacher = true;
    }
    sql = "SELECT * FROM `assignment` WHERE `teamname` LIKE '" + teamname + "'";
    let assignment = await executeSQL(sql);
    sql = "SELECT * FROM `meeting` WHERE `teamname` LIKE '" + teamname + "'"
    let meetings = await executeSQL(sql);
    sql = "SELECT * FROM `notes` WHERE `teamname` LIKE '" + teamname + "'"
    let notes = await executeSQL(sql);
    let students = await getStudents(teamname);
    // console.log(students);
    let teachers = await getTeachers(teamname);
    // console.log(assignment);
    // console.log("teacher", teachers);
    // console.log("student", students);
    res.render("team-info", {
        teacher,
        teachers,
        students,
        teamname,
        assignment,
        meetings,
        notes
    })
})

router.get("/time-table", [checkAuthenticated, checkIsNotTeacher], async (req, res) => {

    let sql = "SELECT * FROM `study_on` WHERE `member` LIKE '" + req.user.email + "'";
    teams = await executeSQL(sql);
    let st = new Set();
    teams.forEach((it) => {
        // console.log("it",it)
        st.add(it);
    });
    // console.log(st);
    meet = [];
    st.forEach(async (it) => {
        // console.log(it.teamname);
        sql = "SELECT * FROM `meeting` WHERE `teamname` LIKE '" + it.team_name + "'";
        let assign = await executeSQL(sql);
        for (const iit in assign) {
            console.log("iit", assign[iit])
            meet.push(assign[iit]);
        }
    })
    // console.log(meet)
    res.render("time-table", {
        meet
    })
})

router.get("/assignments", [checkAuthenticated, checkIsNotTeacher], async (req, res) => {

    let sql = "SELECT * FROM `assignment` WHERE teamname IN (SELECT teamname from study_on WHERE member = '"+req.user.email+"');";
    asgmt = await executeSQL(sql);
    console.log(asgmt)
    console.log("rednering");
    res.render("assginments", {
        asgmt
    })
})

router.get("/pdf-viewer", (req, res) => {
    res.render("pdf-viewer", {
        filename: req.query.filename
    });
})

router.post("/assignment-upload", [checkAuthenticated, checkIsNotTeacher], (req, res) => {
    console.log("inisd assign-upload")
    console.log(req.query.teamname);
    const uploadpath = path.join(__dirname, "../../public/uploads");
    // console.log(uploadpath);
    if (req.files) {
        console.log("file exist")
        var file = req.files.assignfile
        const filename = file.name;
        try {
            const sql = "INSERT INTO `assignment-upload` (`id`, `teamname`, `assign-name`, `email`, `filename`) VALUES (NULL, '" + req.query.teamname + "', '" + req.query.assignName + "', '" + req.user.email + "', '" + filename + "');";
            console.log(sql)
            connection.query(sql, (err, rows) => {
                file.mv(uploadpath + "/" + filename, (error) => {
                    res.redirect("team-info?team_name=" + req.query.teamname);
                })
            })
        } catch (error) {
            console.log(error);
            res.redirect("team-info?team_name=" + req.query.teamname);
        }
    }
    else{
        res.redirect("team-info?team_name=" + req.query.teamname);
    }
})
const getStudents = (teamname) => {
    return new Promise((resolve, reject) => {
        sql = "SELECT * FROM study_on as s, userdetail as u WHERE `team_name` LIKE '" + teamname + "' AND s.member = u.email";
        try {
            connection.query(sql, (err, rows) => {
                // console.log("rows inside st", rows)
                if (err) {
                    console.log("error", err);
                } else {
                    resolve(rows);
                }
            })
        } catch (e) {
            console.log(e);
            reject();
        }
    })
}

const getTeachers = (teamname) => {
    return new Promise((resolve, reject) => {
        sql = "SELECT uname FROM teaches_on as t, userdetail as u WHERE `team_name` LIKE '" + teamname + "' AND t.email = u.email";
        try {
            connection.query(sql, (err, rows) => {
                // console.log("rows inside st", rows)
                if (err) {
                    console.log("error", err);
                } else {
                    resolve(rows);
                }
            })
        } catch (e) {
            console.log(e);
            reject();
        }

    })
}
router.post("/addMarks", [checkAuthenticated, checkIsTeacher], async (req, res) => {
    const test = req.body.test;
    const marks = req.body.mark;
    const teamname = req.body.teamname;
    const student = req.body.student;
    const subject = req.body.subject;
    const sql = "INSERT INTO `marks` (`id`, `teamname`, `test`, `marks`, `subject`, `student`) VALUES (NULL, '"+teamname+"', '"+test+"', '"+marks+"', '"+subject+"', '"+student+"');"
    let temp = await executeSQL(sql);
    res.send({
        msg : "Marks Added"
    })
})
router.get("/getMarks", [checkAuthenticated, checkIsTeacher], async (req, res) => {
    let test = req.query.test;
    const sql = "select * from marks where test = '"+test+"'";
    let marks = await executeSQL(sql);
    res.send({
        marks
    })
})
const executeSQL = (sql) => {
    return new Promise((resolve, reject) => {
        try {
            connection.query(sql, (err, rows) => {
                // console.log("rows inside st", rows)
                if (err) {
                    console.log("error", err);
                } else {
                    resolve(rows);
                }
            })
        } catch (e) {
            console.log(e);
            reject();
        }

    })
}

module.exports = router;