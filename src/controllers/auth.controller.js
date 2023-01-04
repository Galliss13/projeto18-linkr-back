import { v4 as uuid } from 'uuid';
import bcrypt from 'bcrypt';
import { db } from "../database/db.js";
import { singInSchema } from "../schemas/singIn.schema.js";
import { singUpSchema } from "../schemas/singUp.schema.js";
import { getExistSession, getExistUser, insertNewUserInUsers, insertTokenInSession, updateTokenInSession } from "../repositories/auth.repositories.js";


export async function singInRegister(req, res) {

    const body = req.body

    const validation = singInSchema.validate(body, { abortEarly: false })

    if (validation.error) {
        const errors = validation.error.details.map(e => e.message)
        return res.status(400).send(errors)
    }

    const existUser = await getExistUser(body.email)

    if (!existUser.rows[0]) {
        return res.sendStatus(404)
    }

    const validatePassword = bcrypt.compareSync(body.password, existUser.rows[0].password)

    if (!validatePassword) {
        return res.sendStatus(404)
    }

    const newToken = uuid()

    const existSession = await getExistSession(existUser.rows[0].id)    

    if (existSession.rows[0]) {
        await updateTokenInSession(newToken, existUser.rows[0].id)
    } else {
        await insertTokenInSession(newToken,existUser.rows[0].id)
    }

    try {

        res.status(200).send({ token: newToken, user: existUser.rows[0] })

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}


export async function singUpRegister(req, res) {

    const body = req.body

    const validation = singUpSchema.validate(body, { abortEarly: false })

    if (validation.error) {
        const errors = validation.error.details.map(e => e.message)
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