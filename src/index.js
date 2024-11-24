// Importación de dependencias
import express from 'express'
import cors from 'cors';
import dotenv from 'dotenv';
import cookieParser from 'cookie-parser';
// Importacion de rutas locales
import userRoutes from './routes/users.routes.js'
import auth from './routes/auth.routes.js'  
// Uso de middlewares
dotenv.config()
const app = express();
const port = 3000;

app.use(cookieParser());
app.use(cors());
app.use(express.json())
app.use(auth)
app.use(userRoutes)

// Encendido del servidor
app.listen(port, () => {
    console.log(`Server running in port ${port}`);  
})