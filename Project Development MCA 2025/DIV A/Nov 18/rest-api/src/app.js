import express from "express";

const app = express();

// app.use("/api/users", userRoutes);
// app.use("api/posts", postRoutes);

app.get("/", (req, res) => {
  res.status(504).json({ message: "Hello World" });
});

app.get("/greet/:name", (req, res) => {
  res.send("<h1>Hello " + req.params.name + "</h1>");
});

export default app;
