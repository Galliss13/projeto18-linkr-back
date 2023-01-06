import { Router } from "express"
import { persistLogin, singInRegister, singUpRegister } from "../controllers/auth.controller.js"
import { createOrUpdateSessions, validateSingInMiddleware, validateSingUpMiddleware } from "../middlewares/validateAuths.middlewares.js"
import { validateToken } from "../middlewares/validateToken.middleware.js"

const router = Router()

router.post('/sign-in', validateSingInMiddleware, createOrUpdateSessions, singInRegister)
router.post('/sign-up', validateSingUpMiddleware, singUpRegister)
router.get('/persist-login', validateToken, persistLogin )

export default router