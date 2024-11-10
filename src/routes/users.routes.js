import { Router } from "express";
import { getUsers, createUsers, updateUsers, deleteUsers } from "../controllers/users.controllers.js";


const router = Router()

router.get('/user', getUsers)

router.post('/user', createUsers)

router.put('/user', updateUsers)

router.delete('/user', deleteUsers)

export default router