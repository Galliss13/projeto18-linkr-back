import { Router } from "express";
import { getPosts } from "../controllers/posts.controller.js";
import { createPostController } from "../controllers/posts.controller.js";
import { validateCreatePost } from "../middlewares/validateCreatePost.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";

const router = Router()

router.get('/timeline', getPosts)
router.post('/post', validateToken ,validateCreatePost, createPostController)
router.delete('/post/:id')
router.put('/post/:id')

export default router