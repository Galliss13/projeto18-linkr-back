import { Router } from "express";

const router = Router()

router.get('/timeline')
router.post('/post')
router.delete('/post/:id')
router.put('/post/:id')

export default router