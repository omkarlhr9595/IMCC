import express from "express";
import * as userController from "../controllers/userController.js";
import { validateUser } from "../middleware/validator.js";

const router = express.Router();

// Routes
router.get("/", userController.getAllUsers);
router.get("/:id", userController.getUserById);
router.post("/", validateUser, userController.createUser);
router.put("/:id", userController.updateUser);
router.delete("/:id", userController.deleteUser);

export default router;