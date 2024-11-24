import { Router } from "express";
import { getUsers, getUserActives, getUserData, loginUsers, updateUsers, deleteUsers } from "../controllers/users.controllers.js";
import { authenticateToken } from "../middleware/authMiddleware.js";

// rutas de acceso a la api para el usuario
const router = Router()

router.get('/user', authenticateToken, getUsers)

router.get('/users-total', authenticateToken, getUserActives)

router.get('/users-data/:userId', getUserData)

router.post('/user', loginUsers)

router.put('/user', updateUsers)

router.delete('/user', deleteUsers)

export default router