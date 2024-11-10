import { Router } from "express";
import { authenticateToken } from "../middleware/authMiddleware.js";

const router = Router()

router.post('/verificar-token', authenticateToken, (req, res) => {
    res.status(200).json({ message: "Token válido" });
});

export default router