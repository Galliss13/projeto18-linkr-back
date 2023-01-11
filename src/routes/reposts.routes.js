import { Router } from "express";
import { repostController } from "../controllers/reposts.controller.js";
import { validateRepost } from "../middlewares/reposts.middleware.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";

const router = Router();

router.post("/repost/:postId", validateToken, validateRepost, repostController);

export default router;
