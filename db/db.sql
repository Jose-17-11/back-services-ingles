-- Para conectarse manualmente a la base de datos ingresar el comando: 
-- sudo docker exec -it mysql mysql -u root -p*****

CREATE DATABASE inglishServices; 
USE inglishServices;

-- Crear tabla usuarios
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    no_control VARCHAR(20) NOT NULL,
    status VARCHAR(20) NOT NULL
);

-- Crear tabla Logros
CREATE TABLE Logros (
    id_logro INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT
);

-- Crear tabla Usuarios_Logros
CREATE TABLE Usuarios_Logros (
    id_usuario INT,
    id_logro INT,
    fecha DATE NOT NULL,
    PRIMARY KEY (id_usuario, id_logro),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_logro) REFERENCES Logros(id_logro) ON DELETE CASCADE
);

-- Crear tabla Niveles
CREATE TABLE Niveles (
    id_nivel INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    descripcion TEXT,
    estado VARCHAR(20) NOT NULL
);

-- Crear tabla Progreso
CREATE TABLE Progreso (
    id_progreso INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE
);

-- Crear tabla Sesiones
CREATE TABLE Sesiones (
    id_sesion INT AUTO_INCREMENT PRIMARY KEY,
    id_progreso INT,
    nombre VARCHAR(255) NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE,
    porcentaje INT NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (id_progreso) REFERENCES Progreso(id_progreso) ON DELETE CASCADE
);

-- Crear tabla Niveles_Sesiones
CREATE TABLE Niveles_Sesiones (
    id_sesion INT,
    id_nivel INT,
    porcentaje INT NOT NULL,
    PRIMARY KEY (id_sesion, id_nivel),
    FOREIGN KEY (id_sesion) REFERENCES Sesiones(id_sesion) ON DELETE CASCADE,
    FOREIGN KEY (id_nivel) REFERENCES Niveles(id_nivel) ON DELETE CASCADE
);

-- Crear tabla Usuarios_Niveles
CREATE TABLE Usuarios_Niveles (
    id_usuario INT,
    id_nivel INT,
    fecha_logro DATE NOT NULL,
    PRIMARY KEY (id_usuario, id_nivel),
    FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario) ON DELETE CASCADE,
    FOREIGN KEY (id_nivel) REFERENCES Niveles(id_nivel) ON DELETE CASCADE
);

-- Insercciones de prueba

INSERT INTO Usuarios (email, password, nombre, no_control, status) 
VALUES
('juan.perez@gmail.com', 'hashedpassword1', 'Juan Pérez', 'A12345', 'activo'),
('ana.gomez@yahoo.com', 'hashedpassword2', 'Ana Gómez', 'B67890', 'activo'),
('luis.martinez@hotmail.com', 'hashedpassword3', 'Luis Martínez', 'C11223', 'inactivo');

INSERT INTO Logros (nombre, descripcion) 
VALUES
('Superación del Nivel 1', 'Logro alcanzado al completar el primer nivel del curso.'),
('Reto completado', 'Logro alcanzado al completar todos los retos del nivel 3.'),
('Nivel avanzado', 'Logro alcanzado al finalizar el curso con un porcentaje superior al 90%.');

INSERT INTO Usuarios_Logros (id_usuario, id_logro, fecha) 
VALUES
(1, 1, '2024-11-01'),
(2, 2, '2024-11-05'),
(1, 3, '2024-11-10');

INSERT INTO Niveles (nombre, descripcion, estado) 
VALUES
('Nivel 1', 'Introducción a los conceptos básicos de inglés.', 'activo'),
('Nivel 2', 'Ampliación de vocabulario y estructuras gramaticales.', 'activo'),
('Nivel 3', 'Conversación avanzada y práctica intensiva.', 'inactivo');

INSERT INTO Progreso (id_usuario, fecha_inicio, fecha_fin, status) 
VALUES
(1, '2024-10-01', '2024-10-15', 'completado'),
(2, '2024-09-15', NULL, 'en progreso'),
(3, '2024-10-20', NULL, 'en progreso');

INSERT INTO Sesiones (id_progreso, nombre, fecha_inicio, fecha_fin, porcentaje, status) 
VALUES
(1, 'Sesión 1: Vocabulario Básico', '2024-10-01', '2024-10-03', 100, 'terminada'),
(1, 'Sesión 2: Gramática Intermedia', '2024-10-04', '2024-10-10', 100, 'terminada'),
(2, 'Sesión 1: Vocabulario Básico', '2024-09-15', NULL, 50, 'incompleta'),
(3, 'Sesión 1: Vocabulario Básico', '2024-10-20', NULL, 10, 'incompleta');

INSERT INTO Niveles_Sesiones (id_sesion, id_nivel, porcentaje) 
VALUES
(1, 1, 100),
(2, 2, 100),
(3, 1, 50),
(4, 3, 10);

INSERT INTO Usuarios_Niveles (id_usuario, id_nivel, fecha_logro) 
VALUES
(1, 1, '2024-10-01'),
(1, 2, '2024-10-10'),
(2, 1, '2024-09-20'),
(3, 1, '2024-10-20');