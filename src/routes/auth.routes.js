import {Router} from "express"
import { singInRegister, singUpRegister } from "../controllers/auth.controller.js"

const router = Router()

router.post('/', singInRegister)
router.post('/sign-up', singUpRegister)

export default router