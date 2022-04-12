const express = require("express");
const path = require("path");
const hbs = require("hbs");
const passport = require("passport");
const flash = require("express-flash");
const session = require("express-session");
const {
    checkAuthenticated,
    checkNotAuthenticated,
    checkIsTeacher,
    checkIsNotTeacher
} = require("./utils/middleware");
const studentRoutes = require("./routes/studentRoutes");
const teacherRoutes = require("./routes/teacherRoutes");
// const upload = require("express-fileupload");
const app = express();

const server = require("http").Server(app);
const io = require('socket.io')(server);
const {v4: uuidv4} = require("uuid");

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

let hostname = "127.0.0.1";

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

app.get("/login",checkNotAuthenticated, (req, res)=>{
    res.render("login");
})

app.get("/test",(req, res) => {
    res.send({
        hello: "how are you"
    })
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

app.use(studentRoutes);
app.use(teacherRoutes);

// app.listen(3000,()=>{
//     console.log("server is up");
// })

app.get("/join", (req,res) => {
    // res.send("This is homepage of my first express app")
    // res.render('zoom');
    res.redirect(`/${uuidv4()}`)
});

app.get('/:room' , (req, res) =>{
    // console.log(req.params);
    
    res.render('room', { roomID : req.params.room})
})

io.on('connection', socket =>{
    socket.on('join-room', (roomID, userId)=>{
        console.log('Joined Room');
        socket.join(roomID);
        // socket.to(roomId).broadcast.emit('user-connected');
        socket.broadcast.to(roomID).emit('user-connected', userId);

        socket.on('message', message =>{
            io.to(roomID).emit('createMessage', message);
        })
    })
})

const port = 3000;
server.listen(port, () => {
    console.log(`Server running at http://${hostname}:${port}/`)
});
