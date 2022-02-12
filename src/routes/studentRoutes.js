const express = require("express");
const router = new express.Router();
const {
    checkAuthenticated,
    checkNotAuthenticated,
    checkIsTeacher,
    checkIsNotTeacher
} = require("../utils/middleware");

router.get("/", [checkAuthenticated, checkIsNotTeacher], (req, res)=>{
    res.render("index",{
        user: req.user
    });
})

module.exports = router;