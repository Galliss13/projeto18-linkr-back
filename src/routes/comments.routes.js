import { Router } from "express";
import { getPostCommentsController, postCommentController } from "../controllers/comments.controller.js";
import { validateCommentPost } from "../middlewares/comments.middleware.js";
import { validateToken } from "../middlewares/validateToken.middleware.js";



const router = Router();

router.get('/comments/:postId',getPostCommentsController )
router.post('/comments/:postId', validateToken, validateCommentPost, postCommentController)

export default router;
