import { Router } from "express";

import authRouter from "./auth.routes.js";
import postsRouter from "./posts.routes.js";
import likesRouter from "./likes.routes.js";
import hashtagRouter from "./hashtags.routes.js";
import followRouter from './follow.routes.js'
import searchRouter from "./search.routes.js";
import commentsRouter from "./comments.routes.js";
import repostsRouter from "./reposts.routes.js";


const router = Router();

router.use(authRouter);
router.use(postsRouter);
router.use(likesRouter);
router.use(hashtagRouter);
router.use(searchRouter);
router.use(followRouter)
router.use(commentsRouter);
router.use(repostsRouter);


export default router;
