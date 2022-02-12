const express = require("express");
const router = new express.Router();
const {
    checkAuthenticated,
    checkNotAuthenticated,
    checkIsTeacher,
    checkIsNotTeacher
} = require("../utils/middleware");

router.get("/trdashboard",[checkAuthenticated, checkIsTeacher], (req, res)=>{
    res.render("trdashboard");
})

module.exports = router;