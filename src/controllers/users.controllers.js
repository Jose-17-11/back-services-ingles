import { modelReadUsers, modelLoginUsers } from "../model/users.model.js";

export const getUsers = async (req, res) => {
    try {
        const [users] = await modelReadUsers(); 
        res.json(users);
    } catch (error) {
        console.error("Error fetching users:", error);
        res.status(500).json({ message: "Error fetching users" });
    }
};

export const createUsers = (req, res) => {
    console.log(req.body);
    res.send('Creando usuarios')
}

export const updateUsers = (req, res) => {
    res.send('Actualizando usuarios')
}

export const deleteUsers = (req, res) => {
    res.send('Eliminando usuarios')
}