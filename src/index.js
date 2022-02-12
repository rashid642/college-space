const express = require("express");
const path = require("path");
const hbs = require("hbs");
const passport = require("passport");
const flash = require("express-flash");
const session = require("express-session");
// const upload = require("express-fileupload");
const app = express();

const publicDirectory = path.join(__dirname,"../public");
const viewsPath = path.join(__dirname, "../templates/views");
const partialsPath = path.join(__dirname, "../templates/partials");
const connection = require("./utils/dbconnection")

app.set("view engine", "hbs");
app.set("views", viewsPath);
hbs.registerPartials(partialsPath);
app.use(express.static(publicDirectory));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
// app.use(upload());

app.use(flash());
app.use(session({
    secret: "secret",
    resave: false,
    saveUninitialized: false
}))
app.use(passport.initialize());
app.use(passport.session());

const initializePassport = require("./utils/passportConfig");
initializePassport(passport, email => {
    return new Promise((resolve, reject) => {
        const sql = "SELECT * FROM `userdetail` WHERE `email` = '" + email + "'";
        connection.query(sql, (err, rows) => {
            console.log(rows[0]);
            resolve(rows[0]);
        })
    })
}, id => {
    return new Promise((resolve, reject) => {
        const sql = "SELECT * FROM `userdetail` WHERE `id` = " + id + "";
        connection.query(sql, (err, rows) => {
            resolve(rows[0]);
        })
    })
});

app.get("/", [checkAuthenticated, checkIsNotTeacher], (req, res)=>{
    res.render("index",{
        user: req.user
    });
})
app.get("/login",checkNotAuthenticated, (req, res)=>{
    res.render("login");
})
app.get("/trdashboard",[checkAuthenticated, checkIsTeacher], (req, res)=>{
    res.render("trdashboard");
})
app.post("/login",checkNotAuthenticated, passport.authenticate("local", {
    successRedirect: "/",
    failureRedirect: "/login",
    failureFlash: true,
}))
app.get("/logout", checkAuthenticated, (req, res) => {
    req.logOut();
    console.log('Log out done');
    res.redirect("/login");
})

function checkAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return next()
    }
    res.redirect('/login')
}

function checkNotAuthenticated(req, res, next) {
    if (req.isAuthenticated()) {
        return res.redirect('/')
    }
    next()
}

function checkIsTeacher(req, res, next) {
    if (req.user.status === "teacher") {
        return next();
    } else {
        res.redirect("/");
    }
}
function checkIsNotTeacher(req, res, next) {
    if (req.user.status !== "teacher") {
        return next();
    } else {
        res.redirect("/trdashboard");
    }
}

app.listen(3000,()=>{
    console.log("server is up");
})