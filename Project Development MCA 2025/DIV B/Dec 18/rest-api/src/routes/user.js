import express from "express";
import * as userController from "../controllers/userContoller.js";
import { authenticateToken } from "../utils/jwt.js";

const router = express.Router();

// Public routes (no authentication required)
router.post("/register", userController.createUser); // Register route
router.post("/login", userController.loginUser); // Login route
router.post("/logout", userController.logoutUser); // Logout route

// Protected routes (require JWT authentication)
router.get("/", authenticateToken, userController.getAllUsers);
router.get("/:id", authenticateToken, userController.getUserById);
router.post("/", authenticateToken, userController.createUser);
router.put("/:id", authenticateToken, userController.updateUser);
router.delete("/:id", authenticateToken, userController.deleteUser);

export default router;
