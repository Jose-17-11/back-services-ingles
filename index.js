import express from 'express'
import { pool } from './db.js';

const app = express();
const port = 3000

app.get('/', (req, res) => {
    res.send("Hello world")
})

app.get('/query', async (req, res) => {
    const [result] = await pool.query('SELECT * FROM usuarios')
    res.json(result)
})

app.listen(port)