import express from "express";
import cors from "cors";
import { errorHandler, notFound } from "./middleware/errorHandler.js";
import userRoutes from "./routes/users.js";
import postRoutes from "./routes/posts.js";

const app = express();

// Middleware
app.use(cors());
app.use(express.json());

// Routes
app.use("/api/users", userRoutes);
app.use("/api/posts", postRoutes);

// Health check
app.get("/", (req, res) => {
  res.json({ message: "Social Media API is running" });
});

// Error handling middleware (must be last)
app.use(notFound);
app.use(errorHandler);

export default app;