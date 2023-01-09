import { Router } from "express";
import {
  getPosts,
  getPostsFromHashtag,
  getUserPosts,
} from "../controllers/posts.controller.js";
import { createPostController, deletePost, editPost } from "../controllers/posts.controller.js";
import { deleteHashtags, validateCreatePost, validateEditPost } from "../middlewares/posts.middleware.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";

const router = Router();

router.get("/timeline", getPosts);
router.get("/user/:id", getUserPosts);
router.get("/posts/:hashtagName", validateToken, getPostsFromHashtag);
router.post("/post", validateToken, validateCreatePost, createPostController);
router.delete("/post/:id",validateToken, deleteHashtags, deletePost);
router.put("/post/:postId",validateToken, validateEditPost, editPost);

export default router;
