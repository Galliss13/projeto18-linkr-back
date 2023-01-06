import { Router } from "express";
import { trendingHashtagsController } from "../controllers/hashtags.controller.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";

const router = Router();

router.get("/hashtags");
router.get("/trending", trendingHashtagsController);
router.post("/hashtag");
router.post("/hashtagUse/:hashtagId/:postId");
router.delete("/hashtag/:hashtagId");

export default router;
