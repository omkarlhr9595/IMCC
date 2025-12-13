import express from "express";
import userRoutes from "./routes/user.js";
import noteRoutes from "./routes/note.js";

const app = express();

// Middleware to parse JSON bodies
app.use(express.json());

// Routes
app.use("/api/users", userRoutes);
app.use("/api/notes", noteRoutes);

export default app;
