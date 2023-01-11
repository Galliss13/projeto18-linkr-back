import { Router } from "express";
import { checkFollow, followOrUnfollow } from "../controllers/follow.controller.js";
import { checkExistUsers } from "../middlewares/follow.middleware.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";

const router = Router()

router.get('/follow/:followerId/:followedId', checkExistUsers, checkFollow )
router.post('/follow-user', validateToken, checkExistUsers,  followOrUnfollow)

export default router