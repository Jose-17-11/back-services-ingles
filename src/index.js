import express from 'express'
import cors from 'cors';

import userRoutes from './routes/users.routes.js'

const app = express();
const port = 3000

app.use(cors());
app.use(express.json())
app.use(userRoutes)

app.listen(port, () => {
    console.log(`Server running in port ${port}`);
    
})