/* ==============================================================================
   CURSO CEC - CLASE 03: DML BÁSICO (INSERT, UPDATE, DELETE)
============================================================================== */

-- Creamos una tabla temporal para practicar sin dañar nuestros datos principales
CREATE TABLE Clientes_Demo (
    Cliente_ID INT PRIMARY KEY,
    Nombre VARCHAR(50),
    Ciudad VARCHAR(50),
    Tipo VARCHAR(20)
);

-- 1. INSERT INTO (Forma segura especificando columnas)
INSERT INTO Clientes_Demo (Cliente_ID, Nombre, Ciudad, Tipo)
VALUES (1, 'Aaron Olmedo', 'Quito', 'Normal');

-- INSERT INTO (Insertando múltiples filas a la vez)
INSERT INTO Clientes_Demo (Cliente_ID, Nombre, Ciudad, Tipo)
VALUES 
    (2, 'Samira Rojas', 'Guayaquil', 'VIP'),
    (3, 'Juan Perez', 'Cuenca', 'Normal'),
    (4, 'Maria Gomez', 'Quito', 'Normal');

SELECT * FROM Clientes_Demo; -- Verificamos que se insertaron

-- ==============================================================================

-- 2. UPDATE (Actualizar información)
-- Vamos a promover a Aaron a cliente VIP. 
-- ¡NUNCA OLVIDAR EL WHERE!
UPDATE Clientes_Demo
SET Tipo = 'VIP'
WHERE Cliente_ID = 1;

-- UPDATE con Operadores Lógicos (AND / OR)
-- A los clientes VIP de Quito les vamos a añadir un asterisco a su tipo.
UPDATE Clientes_Demo
SET Tipo = 'VIP*'
WHERE Ciudad = 'Quito' AND Tipo = 'VIP';

SELECT * FROM Clientes_Demo; -- Verificamos los cambios

-- ==============================================================================

-- 3. DELETE (Eliminar filas específicas)
-- Vamos a eliminar al cliente 3 porque ya no está activo.
DELETE FROM Clientes_Demo
WHERE Cliente_ID = 3;

-- 4. DROP (Destruir la tabla)
-- ¡OJO! Esto borra la estructura completa de la base de datos.
-- (Lo dejo comentado para que no se ejecute por accidente)
-- DROP TABLE Clientes_Demo;