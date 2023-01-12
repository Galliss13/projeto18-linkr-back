import { getUserByBody } from "../repositories/follow.repositories.js"


export async function checkExistUsers(req, res, next){

    let followedId = req.body.followedId 
    let followerId = req.body.followerId
    
    /* If it wasn't pass by body try to get by params  */
    if(!followedId && !followerId){
        followedId = req.params.followedId
        followerId = req.params.followerId
    }

    if(followedId === followerId){
        return res.sendStatus(409)
    }

    /* Check users */
    const existFollowed = await getUserByBody(followedId)

    const existFollower = await getUserByBody(followerId)

    if(!existFollowed.rows[0] || !existFollower.rows[0]){
        return res.sendStatus(404)
    }

    next()
}
