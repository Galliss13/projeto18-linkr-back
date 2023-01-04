import { insertNewUserInUsers } from "../repositories/auth.repositories.js";


export async function singInRegister(req, res) {

    const { user, token } = res.locals

    try {

        res.status(200).send({ token, user })

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}


export async function singUpRegister(req, res) {

    const { body, passwordHash } = res.locals

    try {
        
        await insertNewUserInUsers(body, passwordHash)

        res.sendStatus(200)

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}