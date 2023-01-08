import { Router } from "express";

import authRouter from "./auth.routes.js";
import postsRouter from "./posts.routes.js";
import likesRouter from "./likes.routes.js";
import hashtagRouter from "./hashtags.routes.js";
import searchRouter from './search.routes.js'

const router = Router();

router.use(authRouter);
router.use(postsRouter);
router.use(likesRouter);
router.use(hashtagRouter);
router.use(searchRouter)

export default router;
