const express = require("express");
const router = new express.Router();
const {
    checkAuthenticated,
    checkNotAuthenticated,
    checkIsTeacher,
    checkIsNotTeacher
} = require("../utils/middleware");
const connection = require("../utils/dbconnection");

// router.use(express.json)

router.get("/trdashboard",[checkAuthenticated, checkIsTeacher], (req, res)=>{
    res.render("trdashboard");
})
router.get("/create-teams", [checkAuthenticated, checkIsTeacher], (req, res)=>{
    res.render("create-teams",{
        tremail : req.user.email
    })
})
router.post("/create-team",[checkAuthenticated, checkIsTeacher], (req, res)=>{
    console.log(req.body);
    const teamName = req.body.teamName;
    const teamDesc = req.body.teamDesc;
    try{
        const sql = "INSERT INTO `teams` (`id`, `team_name`, `team_description`) VALUES (NULL, '"+teamName+"', '"+teamDesc+"');";
        connection.query(sql, (err, rows) => {
            if(err){
                console.log(err);
            }
            return res.send("Team is created")
        })
    }catch(e){
        return console.log(e);
    }
})
router.post("/add-student",[checkAuthenticated, checkIsTeacher],(req, res) => {
    console.log(req.body);
    const teamName = req.body.teamName;
    const memb = req.body.memb;
    try{
            const sql = "INSERT INTO `study_on` (`id`, `team_name`, `member`) VALUES (NULL, '"+teamName+"', '"+memb+"');";
            connection.query(sql, (err, rows) => {
                if(err){
                    console.log(err);
                }
                return res.send("Team memebrs are added")
            })
        }catch(e){
            return console.log(e);
        }
})
router.post("/add-teacher",[checkAuthenticated, checkIsTeacher],(req, res) =>{
    console.log(req.body);
    const teamName = req.body.teamName;
    const teacher = req.body.teacher;
    try{
            const sql = "INSERT INTO `teaches_on` (`id`, `email`, `team_name`) VALUES (NULL, '"+teacher+"', '"+teamName+"');";
            connection.query(sql, (err, rows) => {
                if(err){
                    console.log(err);
                }
                return res.send("Teacher memebrs are added")
            })
        }catch(e){
            return console.log(e);
        }
})
router.get("/notices", [checkAuthenticated], (req, res)=>{
    const sql = "SELECT * FROM `notices`";
    let teacher = false;
    if(req.user.status == "teacher"){
        teacher = true;
    }
    try{
            connection.query(sql, (err, rows) => {
                if(!err){
                    console.log(rows);
                    return res.render("notices",{
                        teacher,
                        rows
                    });
                }else{
                    console.log(err)
                }
            })
        }catch(e){
            return console.log(e);
        }
})
router.post("/notices", [checkAuthenticated, checkIsTeacher], (req, res)=>{
    const msg = req.body.message;
    const sql = "INSERT INTO `notices` (`id`, `email`, `date`, `msg`) VALUES (NULL, '"+req.user.email+"', current_timestamp(), '"+msg+"');";
    try{
            connection.query(sql, (err, rows) => {
                if(!err){
                    return res.redirect("notices");
                }else{
                    console.log(err)
                }
            })
        }catch(e){
            res.redirect("notices");
            console.log(e);
        }
})

module.exports = router;