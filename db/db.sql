-- Para conectarse manualmente a la base de datos ingresar el comando: 
-- sudo docker exec -it mysql mysql -u root -p*****

-- Usuario de prueba: juan.perez@gmail.com
-- Contraseña de prueba: hashedpassword1

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

-- Crear tabla Sesiones
CREATE TABLE Sesiones (
  id_sesion INT AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(255) NOT NULL,
  porcentaje INT NOT NULL,  
  status VARCHAR(20) NOT NULL  
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

-- Crear tabla Progreso
CREATE TABLE Progreso (
  id_progreso INT AUTO_INCREMENT PRIMARY KEY,
  id_sesion INT,
  id_usuario INT,
  fecha_inicio DATE,
  fecha_fin DATE,  
  status VARCHAR(20),
  FOREIGN KEY (id_sesion) REFERENCES Sesiones(id_sesion),
  FOREIGN KEY (id_usuario) REFERENCES Usuarios(id_usuario)
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

-- Procedimiento sql que devuelve a los 10 mas altos
DELIMITER $$

CREATE PROCEDURE ObtenerUsuariosConNivelMasAlto()
BEGIN
    SELECT 
        Usuarios.nombre AS nombre_usuario, 
        Niveles.nombre AS nivel_mas_alto,
        Usuarios_Niveles.fecha_logro AS fecha_de_logro
    FROM Usuarios
    JOIN Usuarios_Niveles ON Usuarios.id_usuario = Usuarios_Niveles.id_usuario
    JOIN Niveles ON Usuarios_Niveles.id_nivel = Niveles.id_nivel
    ORDER BY Niveles.id_nivel DESC, Usuarios_Niveles.fecha_logro ASC
    LIMIT 10;
END$$

DELIMITER ;


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

-- Insertar niveles comenzando desde id_nivel = 1
INSERT INTO Niveles (id_nivel, nombre, descripcion, estado) VALUES
(1, 'Inglés Básico 1', 'Nivel de inglés básico inicial, introducción a vocabulario y frases comunes.', 'activo'),
(2, 'Inglés Básico 2', 'Nivel de inglés básico intermedio, profundización en estructuras gramaticales y vocabulario.', 'activo'),
(3, 'Inglés Básico 3', 'Nivel de inglés básico avanzado, expansión de vocabulario y ejercicios de gramática avanzada.', 'activo'),
(4, 'Inglés Básico 4', 'Nivel de inglés básico alto, preparación para pasar al nivel intermedio con enfoque en comprensión auditiva.', 'activo'),
(5, 'Inglés Básico 5', 'Nivel final de inglés básico, consolidación de conocimientos y práctica intensiva de conversación.', 'activo'),
(6, 'Inglés Intermedio 1', 'Nivel intermedio de inglés, introducción a frases complejas y comprensión de textos más avanzados.', 'activo'),
(7, 'Inglés Intermedio 2', 'Nivel intermedio de inglés, enfocado en hablar de temas abstractos y la mejora de habilidades auditivas.', 'activo'),
(8, 'Inglés Intermedio 3', 'Nivel intermedio avanzado, mayor fluidez en conversación y análisis de textos complejos.', 'activo'),
(9, 'Inglés Intermedio 4', 'Nivel intermedio alto, introducción a la literatura en inglés y debate sobre temas sociales y culturales.', 'activo'),
(10, 'Inglés Intermedio 5', 'Nivel intermedio avanzado, perfeccionamiento de habilidades lingüísticas para alcanzar nivel avanzado.', 'activo');

