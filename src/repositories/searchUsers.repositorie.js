import { db } from "../database/db.js";


export function getUsersSearch(search){
    
    const users = db.query(`SELECT id, name, "imageUrl" FROM users WHERE users.name LIKE ($1 || '%')`, 
    [search])
    return users
}