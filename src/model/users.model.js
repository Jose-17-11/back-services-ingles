import { pool } from '../db.js';

export const modelReadUsers = async () => {
    const [rows] = await pool.query("CALL ObtenerUsuariosConNivelMasAlto()");
    console.log("Query result:", rows);  // Log para ver el resultado de la consulta
    return rows; 
}

export const modelLoginUsers = () => {

}

export const modelUpdateUsers = () => {

}

export const modelDeleteUsers = () => {

}