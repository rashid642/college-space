const express = require("express");
const router = new express.Router();
const {
    checkAuthenticated,
    checkNotAuthenticated,
    checkIsTeacher,
    checkIsNotTeacher
} = require("../utils/middleware");
const connection = require("../utils/dbconnection");

router.get("/", [checkAuthenticated, checkIsNotTeacher], (req, res)=>{
    res.render("index",{
        user: req.user
    });
})

router.get("/teams",[checkAuthenticated], (req, res) => {
    if(req.user.status == "teacher"){
        teacher = true;
        const sql = "SELECT * FROM `teaches_on` WHERE `email` LIKE '"+req.user.email+"'";
        try{
            connection.query(sql, (err, rows) => {
                console.log("rows inside tr",rows)
                if(err){
                    console.log("error",err);
                }else{
                        return res.render("teams",{
                            teacher,
                            rows,
                        })
                }
            })
        }catch(e){
            console.log(e);
            return res.redirect("/");
        }
    }
    else{
        const sql = "SELECT * FROM `study_on` WHERE `member` LIKE '"+req.user.email+"'";
        try{
            connection.query(sql, (err, rows) => {
                console.log("rows inside st",rows)
                if(err){
                    console.log("error",err);
                }else{
                    return res.render("teams",{
                        rows,
                    })
                }
            })
        }catch(e){
            console.log(e);
            res.redirect("/");
        }
    }
})

router.get("/team-info",[checkAuthenticated], async (req, res) => {
    teamname = req.query.team_name
    console.log(teamname);
    teacher = false;
    if(req.user.status == "teacher"){
        teacher = true;
    }
    sql = "SELECT * FROM `study_on` WHERE `team_name` LIKE '"+teamname+"'";
    let students = await getStudents(teamname);
    let teachers = await getTeachers(teamname);
       
        console.log("teacher",teachers);
        console.log("student",students);
    res.render("team-info",{
        teacher,
        teachers,
        students,
        teamname
    })
})

const getStudents = (teamname) =>{
    return new Promise ((resolve,reject) =>{
        sql = "SELECT * FROM `study_on` WHERE `team_name` LIKE '"+teamname+"'";
            try{
                connection.query(sql, (err, rows) => {
                    console.log("rows inside st",rows)
                    if(err){
                        console.log("error",err);
                    }else{
                        resolve(rows);
                    }
                })
            }catch(e){
                console.log(e);
                reject();
            }
       })
}

const getTeachers = (teamname) =>{
    return new Promise ((resolve,reject) =>{
        sql = "SELECT * FROM `teaches_on` WHERE `team_name` LIKE '"+teamname+"'";
            try{
                connection.query(sql, (err, rows) => {
                    console.log("rows inside st",rows)
                    if(err){
                        console.log("error",err);
                    }else{
                        resolve(rows);
                    }
                })
            }catch(e){
                console.log(e);
                reject();
            }
            
       })
}

module.exports = router;