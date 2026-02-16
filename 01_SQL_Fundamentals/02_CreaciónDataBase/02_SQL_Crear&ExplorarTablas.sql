/* ==============================================================================
   CURSO CEC - CLASE 02: CREACIÓN DE ENTORNO (DDL)
   Autor: Aaron Olmedo
   Objetivo: Crear la Base de Datos y la estructura de la tabla para el Supermercado.
============================================================================== */
-- 1. EL CONCEPTO DDL

-- 1. CREAR LA BASE DE DATOS
-- Vamos a crear la base de datos (DB) dentro del entorno.
	-- Las DB contienenm tablas, las tablas contienen filas, las filas contienen datos.
CREATE DATABASE SupermercadoDB;
GO

-- 2. USAR LA BASE DE DATOS
-- Indicamos a SQL Server que vamos a trabajar con la base de datos que acabamos de crear.
	-- ** HACER SIEMPRE AL INICIO! **
USE SupermercadoDB;
GO

-- 3. CREAR LA TABLA (Definiendo la estructura basada en nuestro CSV)
-- Fíjate cómo cada columna tiene su tipo de dato específico.
CREATE TABLE Ventas (
    Invoice_ID VARCHAR(20) PRIMARY KEY,  -- Es texto, pero también es la Clave Primaria (única por factura)
    Branch VARCHAR(5),                   -- Sucursal (A, B, C)
    City VARCHAR(50),                    -- Ciudad
    Customer_type VARCHAR(20),           -- Normal / Member
    Gender VARCHAR(10),                  -- Female / Male
    Product_line VARCHAR(100),           -- Categoría del producto
    Unit_price DECIMAL(10, 2),           -- Precio unitario (con 2 decimales)
    Quantity INT,                        -- Cantidad comprada (entero)
    Tax_5 DECIMAL(10, 4),                -- Impuesto (necesita más precisión decimal)
    Total DECIMAL(10, 2),                -- Total a pagar
    Sale_Date DATE,                      -- Fecha de la venta
    Sale_Time TIME,                      -- Hora de la venta
    Payment VARCHAR(50),                 -- Método de pago (Ewallet, Cash, Credit Card)
    cogs DECIMAL(10, 2),                 -- Costo de los bienes vendidos
    gross_margin_percentage DECIMAL(5, 2),-- Porcentaje de margen bruto
    gross_income DECIMAL(10, 4),         -- Ingreso bruto
    Rating DECIMAL(3, 1)                 -- Calificación del cliente (ej. 9.1)
);
GO

-- 4. VERIFICAR LA ESTRUCTURA
-- Este comando nos permite ver si la tabla se creó correctamente (aunque aún esté vacía).
SELECT * FROM Ventas;

--===============================================================================================

BULK INSERT Ventas 
FROM 'C:\Users\User\OneDrive\Escritorio\GitHub\Data_Analytics_Study_Guide\01_SQL_Fundamentals\00_Datasets\1. Ventas supermercado.csv'
WITH (
    FIRSTROW = 2,           -- Inicia importando desde la fila 2 (salta los encabezados)
    FIELDTERMINATOR = ';',  -- Las columnas están separadas por punto y coma
    ROWTERMINATOR = '\n'    -- Salto de línea corregido
);

SELECT * FROM Ventas

--===============================================================================================

-- 1. VERIFICAR EL VOLUMEN DE DATOS (¿Se subieron todas las filas?)
-- La función COUNT(*) cuenta cuántos registros exactos hay en la tabla.
-- Deberían ser 1000 filas.
SELECT 
    COUNT(*) AS Total_Transacciones -- 'As' es para poner un 'Apodo a la columna'
FROM Ventas;
-- En este caso, se borra todo lo que quedaba de la consulta base ↓
/* (WHERE
    GROUP BY 
    HAVING
    ORDER BY)*/

-- 2. INSPECCIÓN VISUAL (Muestreo)
-- TOP 10 nos trae solo las primeras 10 filas para no saturar la memoria.
-- Es la mejor forma de ver si las columnas de fecha y decimales se cargaron bien.
SELECT TOP 10 * FROM Ventas
    WHERE Unit_price >60
    ;
-- 3. VERIFICACIÓN DE VALORES ÚNICOS
-- DISTINCT nos permite ver qué categorías existen sin repetirlas.
-- Ejemplo: ¿Qué sucursales (Branches) tenemos realmente en la base?
SELECT DISTINCT 
    Branch 
FROM Ventas
ORDER BY Branch; -- Ordenamos alfabéticamente para verlo más claro  

-- Ahora es necesario que conozcas la tabla y als variables de la tabla. 
-- Usa los comandos anteriores para inspeccionar cada columna y entender qué tipo de datos contiene, cuáles son sus valores únicos, etc. Esto es fundamental para cualquier análisis posterior.