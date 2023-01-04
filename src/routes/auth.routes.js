import { Router } from "express"
import { singInRegister, singUpRegister } from "../controllers/auth.controller.js"
import { createOrUpdateSessions, validateSingInMiddleware, validateSingUpMiddleware } from "../middlewares/validateAuths.middlewares.js"

const router = Router()

router.post('/sign-in', validateSingInMiddleware, createOrUpdateSessions, singInRegister)
router.post('/sign-up', validateSingUpMiddleware, singUpRegister)

export default router