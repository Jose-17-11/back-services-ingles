import { Router } from "express";
import { getUsers, loginUsers, updateUsers, deleteUsers } from "../controllers/users.controllers.js";

// rutas de acceso a la api
const router = Router()

router.get('/user', getUsers)

router.post('/user', loginUsers)

router.put('/user', updateUsers)

router.delete('/user', deleteUsers)

export default router