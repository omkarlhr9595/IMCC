import express from "express";
import {
  createNote,
  getAllNotes,
  getNoteById,
  updateNote,
  deleteNote,
} from "../controllers/noteController.js";
import { authenticateToken } from "../utils/jwt.js";

const router = express.Router();

router.post("/", authenticateToken, createNote);
router.get("/", authenticateToken, getAllNotes);
router.get("/:id", authenticateToken, getNoteById);
router.put("/:id", authenticateToken, updateNote);
router.delete("/:id", authenticateToken, deleteNote);

export default router;
