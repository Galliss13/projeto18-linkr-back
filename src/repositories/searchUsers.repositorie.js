import { db } from "../database/db.js";


export function getUsersSearch(search, followerId){
    
    const users = db.query(`SELECT u.id, u.name, u."imageUrl", f."followerId"
     FROM users u 
     LEFT JOIN follows f 
     ON u.id = f."followedId" 
     WHERE u.name LIKE ($1 || '%')
     ORDER BY f."followerId" = $2;`, 
    [search, followerId])
    return users
}