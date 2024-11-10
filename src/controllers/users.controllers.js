export const getUsers = (req, res) => {
    res.send('Obteniendo usuarios')
}

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