import { Router } from "express";
import { followOrUnfollow } from "../controllers/follow.controller.js";
import { checkExistUsers } from "../middlewares/follow.middleware.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";

const router = Router()

router.post('/follow-user', validateToken, checkExistUsers,  followOrUnfollow)

export default router