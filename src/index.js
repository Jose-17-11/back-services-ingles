import express from 'express'
import cors from 'cors';

import { pool } from './db.js';
import userRoutes from './routes/users.routes.js'

const app = express();
const port = 3000

app.use(cors());
app.use(express.json())
app.use(userRoutes)

app.get('/query', async (req, res) => {
    const [result] = await pool.query('SELECT * FROM usuarios')
    res.json(result)
})

app.listen(port, () => {
    console.log(`Server running in port ${port}`);
    
})