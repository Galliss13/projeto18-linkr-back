import {Router} from "express"
import { singInRegister, singUpRegister } from "../controllers/auth.controller.js"
import { createOrUpdateSessions, validateSingInMiddleware } from "../middlewares/validateAuths.middlewares.js"

const router = Router()

router.post('/',validateSingInMiddleware, createOrUpdateSessions, singInRegister)
router.post('/sing-up', singUpRegister)

export default router