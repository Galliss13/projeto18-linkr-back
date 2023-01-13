import { Router } from "express";
import { getUserBySearch } from "../controllers/search.controller.js";

const router = Router()

router.get('/search-users/:search/:followerId', getUserBySearch )

export default router 