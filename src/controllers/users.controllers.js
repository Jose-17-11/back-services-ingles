// Importaciones y configuración inicial
import jwt from 'jsonwebtoken'
import { modelReadUsers, modelReadUserActives, modelReadUserData, modelLoginUsers } from "../model/users.model.js";

const JWT_SECRET = process.env.JWT_SECRET || 'your_secret_key';

// Llama al procedimiento que muestra los 10 mejores niveles de la aplicacion
export const getUsers = async (req, res) => {
    try {
        const [users] = await modelReadUsers(); 
        res.json(users);
    } catch (error) {
        console.error("Error fetching users:", error);
        res.status(500).json({ message: "Error fetching users" });
    }
};

// Nos muestra todos los usuarios activos
export const getUserActives = async (req, res) => {
    try {
        const [total] = await modelReadUserActives();
        res.json(total);
    } catch (error) {
        console.error("Error fetching users total", error);
        res.status(500).json({message: "Error fetching users total"});
    }
}

// Busca a un usuario en base a su Id
export const getUserData = async (req, res) => {
    try {
        const {userId} = req.params;
        console.log("El id en coockie es: ", userId);
        console.log(userId);
        
        if (!userId) {
            return res.status(400).json({ message: "ID de usuario no proporcionado" });
        }
        const [data] = await modelReadUserData(userId);
        console.log(data[0]);
        
        res.json(data[0])
    } catch (error) {
        console.error("Error fetching user data", error);
        res.status(500).json({message: "Error fetching user data"});
    }
}

// Verifica que el usuario exista en la base de datos y devuelve el id mediante una cookie
export const loginUsers = async (req, res) => {
    try {
        const acceso = await modelLoginUsers(req.body);
        if(acceso.length > 0) {
            const userId = acceso[0].id_usuario;
            console.log(userId);
            
            // Generar el token JWT
            const token = jwt.sign({ userId }, JWT_SECRET, {
                expiresIn: '10m' 
            });
            console.log(token);
            
            res.cookie("userId", userId, {
                httpOnly: true,
                maxAge: 10 * 60 * 1000
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