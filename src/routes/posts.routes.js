import { Router } from "express";
import { getPosts, getPostsFromHashtag } from "../controllers/posts.controller.js";
import { createPostController } from "../controllers/posts.controller.js";
import { validateCreatePost } from "../middlewares/validateCreatePost.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";

const router = Router();

router.get("/timeline", getPosts);
router.get("/posts/:hashtagName", getPostsFromHashtag);
router.post("/post", validateToken, validateCreatePost, createPostController);
router.delete("/post/:id");
router.put("/post/:id");

export default router;
