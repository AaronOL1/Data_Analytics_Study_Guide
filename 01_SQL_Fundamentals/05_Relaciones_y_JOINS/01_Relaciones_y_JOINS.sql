/* ==============================================================================
   CURSO CEC - CLASE 07: MODELO RELACIONAL E INNER JOIN
   Autor: Aaron Olmedo
============================================================================== */

USE SupermercadoDB;
GO

-- ==============================================================================
-- 1. PREPARACIÓN DEL ENTORNO (Creando una tabla secundaria)
-- Vamos a crear una tabla maestra de Sucursales y sus Gerentes.
-- La columna 'Branch' será nuestra Primary Key (PK) aquí.

CREATE TABLE Info_Sucursales (
    Branch VARCHAR(5) PRIMARY KEY,
    Nombre_Gerente VARCHAR(50),
    Region VARCHAR(50)
);

-- Insertamos datos. OJO: Solo insertamos A y B a propósito.
INSERT INTO Info_Sucursales (Branch, Nombre_Gerente, Region)
VALUES 
    ('A', 'Aaron Olmedo', 'Norte'),
    ('B', 'Samira Rojas', 'Sur');

-- ==============================================================================
-- 2. EL INNER JOIN BÁSICO
-- Queremos ver cada factura, pero incluyendo el nombre del gerente de esa sucursal.

SELECT 
    v.Invoice_ID, 
    v.City, 
    v.Branch, 
    s.Nombre_Gerente,   -- Esta columna viene de la segunda tabla
    v.Total
FROM Ventas v           -- 'v' es el alias temporal de la tabla Ventas
INNER JOIN Info_Sucursales s 
    ON v.Branch = s.Branch;  -- El puente: cruzamos donde la letra de sucursal coincida

-- 🚨 NOTA IMPORTANTE: Si ejecutas esto, verás que desaparecieron las ventas 
-- de la sucursal 'C'. ¿Por qué? Porque 'C' no existe en nuestra tabla de Info_Sucursales.
-- El INNER JOIN solo trae las coincidencias exactas.

-- ==============================================================================
-- 3. INNER JOIN COMBINADO CON GROUP BY
-- Nivel Gerencial: ¿Cuánto dinero generó cada Gerente?

SELECT 
    s.Nombre_Gerente, 
    s.Region,
    SUM(v.Total) AS Total_Vendido
FROM Ventas v
INNER JOIN Info_Sucursales s 
    ON v.Branch = s.Branch
GROUP BY 
    s.Nombre_Gerente, 
    s.Region
ORDER BY 
    Total_Vendido DESC;