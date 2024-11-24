import { createPool } from "mysql2/promise";
/**
 * Para obtener el host de la base de datos del contenedor se ingresa el siguiente comando 
 * sudo docker inspect mysql
 */
export const pool = createPool({
    host:'mysql',
    user:'root',
    password:'12345',
    port: 3306,
    database:'inglishServices'
})
