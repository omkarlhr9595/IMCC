import express from "express";


const app = express();


app.get("/", (req, res) => {
    res.send("<h1>Hello World ! from express</h1>");
});

app.get("/greet",(req,res)=>{
    res.send("<h1>Good Morning</h1>");
});

app.get("/greet/:name",(req,res)=>{
    res.send(`<h1>Good Morning ${req.params.name} !</h1>`);
});

app.get("/data",(req,res)=>{
    res.json({
        name: "John",
        age: 20,
        city: "New York"
    });
});

export default app;