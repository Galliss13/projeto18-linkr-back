import { Router } from "express";
import { checkFollow, followOrUnfollow, getAllUserFollows } from "../controllers/follow.controller.js";
import { checkExistUsers } from "../middlewares/follow.middleware.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";

const router = Router()

router.get('/follow/:userId', validateToken, getAllUserFollows)
router.get('/follow/:followerId/:followedId',validateToken, checkExistUsers, checkFollow )
router.post('/follow-user', validateToken, checkExistUsers,  followOrUnfollow)

export default router