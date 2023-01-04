import { db } from "../database/db.js";


export async function SingInRegister(req, res){ 

    

    
    try {
        const users = await db.query(`SELECT * FROM users;`)

        res.status(200).send(users.rows)
        
    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}