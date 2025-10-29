import express from "express";
import * as postController from "../controllers/postController.js";
import { validatePost } from "../middleware/validator.js";

const router = express.Router();

// Routes
router.get("/", postController.getAllPosts);
router.get("/:id", postController.getPostById);
router.post("/", validatePost, postController.createPost);
router.put("/:id", postController.updatePost);
router.delete("/:id", postController.deletePost);
router.post("/:id/like", postController.likePost);
router.post("/:id/comment", postController.addComment);

export default router;