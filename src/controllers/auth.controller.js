import { db } from "../database/db.js";
import { singInSchema } from "../schemas/singIn.schema.js";
import {v4 as uuid} from 'uuid';
import bcrypt from 'bcrypt';


export async function SingInRegister(req, res){ 

    const body = req.body

    const validation = singInSchema.validate(body, {abortEarly:false})

    if(validation.error){
        const errors = singInSchema.error.details.map(e => e.message)
        return res.status(400).send(errors)
    }

    const existUser = await db.query(`SELECT * FROM users WHERE email = $1`, [body.email])

    if(!existUser.rows[0]){
        return res.sendStatus(404)
    }

    const validatePassword = bcrypt.compareSync(body.password, existUser.rows[0].password)

    if(!validatePassword){
        return res.sendStatus(404)
    }

    const newToken = uuid()

    const existSession = await db.query(`SELECT * FROM sessions WHERE "userId" = $1`, [existUser.rows[0].id])

    if(existSession.rows[0]){
        await db.query(`UPDATE sessions SET token = $1 WHERE "userId" = $2`, [newToken, existUser.rows[0].id])
    }else{
        await db.query(`INSERT INTO sessions("userId", token) VALUES ($1, $2)`, [existUser.rows[0].id, newToken])
    }
    
    try {
        
        res.status(200).send({token: newToken, user: existUser.rows[0]})
        
    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}