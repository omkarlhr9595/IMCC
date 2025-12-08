import express from "express";
import userRoutes from "./routes/user.js";
import { authenticateToken } from "./utils/jwt.js";

const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Routes
app.use("/api/users", userRoutes);
// app.use("api/posts", postRoutes);

app.get("/", (req, res) => {
  res.status(504).json({ message: "Hello World" });
});

app.get("/greet/:name", (req, res) => {
  res.send("<h1>Hello " + req.params.name + "</h1>");
});

// Example protected route - requires JWT token
app.get("/api/profile", authenticateToken, (req, res) => {
  // req.user contains the decoded token payload
  res.json({
    message: "This is a protected route",
    user: req.user
  });
});

export default app;
