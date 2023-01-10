import { Router } from "express";
import { validateToken } from "../middlewares/validateToken.middleware.js";



const router = Router();

router.get('/comments/:postId', )
router.post('/comments/', validateToken,)

export default router;
