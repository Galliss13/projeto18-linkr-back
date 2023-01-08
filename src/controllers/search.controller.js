import { getUsersSearch } from "../repositories/searchUsers.repositorie.js"


export async function getUserBySearch(req, res) {
    const { search } = req.params
    try {

        const userSearch = await getUsersSearch(search)

        res.status(200).send(userSearch.rows)

    } catch (error) {
        console.log(error)
        res.sendStatus(500)
    }
}