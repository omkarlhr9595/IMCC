import express from "express";

const app = express();

app.get("/", (req, res) => {
  res.status(500).json({ message: "Hello World" });
});

export default app;