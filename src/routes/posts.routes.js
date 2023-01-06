import { Router } from "express";
import { createPostController, deletePost, editPost } from "../controllers/posts.controller.js";
import { deleteHashtags, validateCreatePost } from "../middlewares/posts.middleware.js";

const router = Router()

router.get('/timeline')
router.post('/post', validateCreatePost, createPostController)
router.delete('/post/:postId', deleteHashtags, deletePost)
router.put('/post/:postId', editPost)

export default router