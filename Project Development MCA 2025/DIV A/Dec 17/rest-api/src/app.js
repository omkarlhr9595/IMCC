import express from "express";
import cors from "cors";
import userRoutes from "./routes/user.js";
import noteRoutes from "./routes/note.js";

const app = express();

// CORS configuration
app.use(cors({
  origin: process.env.FRONTEND_URL || 'http://localhost:5173', // Default to Vite's default port
  credentials: true, // Allow cookies/auth headers
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
}));

// Middleware to parse JSON bodies
app.use(express.json());

// Routes
app.use("/api/users", userRoutes);
app.use("/api/notes", noteRoutes);

export default app;
