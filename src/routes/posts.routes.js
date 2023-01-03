import { Router } from "express";
import { getPosts } from "../controllers/posts.controller.js";

const router = Router()

router.get('/timeline', getPosts)
router.post('/post')
router.delete('/post/:id')
router.put('/post/:id')

export default router