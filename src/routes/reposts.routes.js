import { Router } from "express";
import { deleteRepost, repostController } from "../controllers/reposts.controller.js";
import { validateRepost } from "../middlewares/reposts.middleware.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";

const router = Router();

router.post("/repost/:postId", validateToken, validateRepost, repostController);
router.delete("/repost/:repostId", validateToken, deleteRepost)

export default router;
