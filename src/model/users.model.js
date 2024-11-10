import { pool } from '../db.js';

// Llama al procedimiento que muestra los 10 mejores niveles de la aplicacion
export const modelReadUsers = async () => {
    const [rows] = await pool.query("CALL ObtenerUsuariosConNivelMasAlto()");
    console.log("Query result:", rows);
    return rows; 
}

export const modelReadUserActives = async () => {
    const total = await pool.query("select * from Usuarios where status = 'activo'");
    console.log("Query result: ", total);
    return total    
}

// Esta función verificara el acceso al panel del usuario
export const modelLoginUsers = async (acceso) => {
    const { email, password } = await acceso;
    const [rows] = await pool.query(
        "SELECT id_usuario FROM Usuarios WHERE email = ? AND password = ?",
        [email, password]
    );
    console.log("Query result:", rows);  // Log para ver el resultado de la consulta
    return rows; 
}

export const modelUpdateUsers = () => {

}

export const modelDeleteUsers = () => {

}