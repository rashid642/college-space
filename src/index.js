const express = require("express");
const path = require("path");
const hbs = require("hbs");

const app = express();

const publicDirectory = path.join(__dirname,"../public");
const viewsPath = path.join(__dirname, "../templates/views");
const partialsPath = path.join(__dirname, "../templates/partials");

app.set("view engine", "hbs");
app.set("views", viewsPath);
hbs.registerPartials(partialsPath);

app.use(express.static(publicDirectory));

app.get("", (req, res)=>{
    res.render("index");
})

app.listen(3000,()=>{
    console.log("server is up");
})