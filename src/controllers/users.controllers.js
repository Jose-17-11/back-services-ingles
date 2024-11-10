import jwt from 'jsonwebtoken'
import { modelReadUsers, modelLoginUsers } from "../model/users.model.js";

const JWT_SECRET = process.env.JWT_SECRET || 'your_secret_key';

// Se leen los 10 mejores lugares
export const getUsers = async (req, res) => {
    try {
        const [users] = await modelReadUsers(); 
        res.json(users);
    } catch (error) {
        console.error("Error fetching users:", error);
        res.status(500).json({ message: "Error fetching users" });
    }
};

// Verifica que el usuario exista en la base de datos y devuelve el id mediante una cookie
export const loginUsers = async (req, res) => {
    try {
        const acceso = await modelLoginUsers(req.body);
        if(acceso.length > 0) {
            const userId = acceso[0].id_usuario;
            // Generar el token JWT
            const token = jwt.sign({ userId }, JWT_SECRET, {
                expiresIn: '2m' // Expiración de 1 día
            });
            console.log(token);
            
            res.cookie("userId", userId, {
                httpOnly: true,
                maxAge: 24 * 60 * 60 * 1000 // 1 día
            });
            res.json({ message: "Usuario logueado", token, userId });
        } else {
            res.status(401).json({ message: "Credenciales incorrectas" });
        }
    } catch (error) {
        console.error("Error fetching users:", error);
        res.status(500).json({ message: "Error fetching users" });
    }
}

export const updateUsers = (req, res) => {
    res.send('Actualizando usuarios')
}

export const deleteUsers = (req, res) => {
    res.send('Eliminando usuarios')
}