import { Router } from "express";
import { createPostController } from "../controllers/posts.controller.js";
import { validateCreatePost } from "../middlewares/validateCreatePost.js";

const router = Router()

router.get('/timeline')
router.post('/post', validateCreatePost, createPostController)
router.delete('/post/:id')
router.put('/post/:id')

export default router