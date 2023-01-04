import { v4 as uuid } from 'uuid';
import bcrypt from 'bcrypt';
import { singUpSchema } from "../schemas/singUp.schema.js";
import { getExistSession, getExistUser, insertNewUserInUsers, insertTokenInSession, updateTokenInSession } from "../repositories/auth.repositories.js";


export async function singInRegister(req, res) {

    

    const {user} = res.locals

    // CREATE OR UPDATE A USER SESSION IN SESSIONS

    const newToken = uuid()

    const existSession = await getExistSession(user.id)    

    if (existSession.rows[0]) {
        await updateTokenInSession(newToken, user.id)
    } else {
        await insertTokenInSession(newToken,user.id)
    }

    try {

        res.status(200).send({ token: newToken, user: user })

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}


export async function singUpRegister(req, res) {

    const body = req.body

    const validationSchema = singUpSchema.validate(body, { abortEarly: false })

    if (validationSchema.error) {
        const errors = validationSchema.error.details.map(e => e.message)
        return res.status(400).send(errors)
    }

    const existEmail = await getExistUser(body.email)

    if (existEmail.rows[0]) {
        return res.status(400).send('Email já cadastrado!')
    }

    const passwordHash = bcrypt.hashSync(body.password, 10)

    try {
        await insertNewUserInUsers(body, passwordHash)

        res.sendStatus(200)

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}