import {Router} from "express"
import { SingInRegister } from "../controllers/auth.controller.js"

const router = Router()

router.post('/', SingInRegister)
router.post('/sign-up')

export default router