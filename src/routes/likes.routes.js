import { Router } from "express";

const router = Router()

router.get('/likes/:postId')
router.post('/like/:postId')
router.delete('/like/:postId')

export default router