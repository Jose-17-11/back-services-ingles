import express from 'express'
import cors from 'cors';
import dotenv from 'dotenv';
import cookieParser from 'cookie-parser';

import userRoutes from './routes/users.routes.js'
import auth from './routes/auth.routes.js'  

dotenv.config()
const app = express();
const port = 3000

app.use(cookieParser());
app.use(cors());
app.use(express.json())
app.use(userRoutes)
app.use(auth)

app.listen(port, () => {
    console.log(`Server running in port ${port}`);  
})