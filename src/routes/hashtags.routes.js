import { Router } from "express";

const router = Router()

router.get('/hashtags')
router.get('/trending')
router.post('/hashtag')
router.post('/hashtagUse/:hashtagId/:postId')
router.delete('/hashtag/:hashtagId')

export default router