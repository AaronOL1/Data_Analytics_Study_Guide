/* ==============================================================================
   CURSO CEC - CLASE 05: FUNCIONES DE AGREGACIÓN Y GROUP BY
   Autor: Aaron Olmedo
============================================================================== */

USE SupermercadoDB;
GO

-- 1. FUNCIONES DE AGREGACIÓN GLOBALES (Sin Group By)
-- ¿Cuántas facturas tenemos en total, cuánto dinero ingresó y cuál es el promedio?
SELECT 
    COUNT(Invoice_ID) AS Total_Transacciones,
    SUM(Total) AS Ingreso_Global,
    AVG(Total) AS Ticket_Promedio,
    MAX(Total) AS Venta_Mas_Alta
FROM Ventas;

-- ==============================================================================

-- 2. GROUP BY SIMPLE (Agrupando por una sola categoría)
-- ¿Cuánto dinero ingresó POR CADA ciudad?
SELECT 
    City, 
    SUM(Total) AS Ingreso_Por_Ciudad
FROM Ventas
GROUP BY City; 
-- Nota: Como 'City' no tiene una función matemática en el SELECT, DEBE ir en el GROUP BY.

-- ¿Cuántas transacciones tuvimos POR CADA tipo de cliente?
SELECT 
    Customer_type,
    COUNT(Invoice_ID) AS Cantidad_Compras
FROM Ventas
GROUP BY Customer_type;

-- ==============================================================================

-- 3. GROUP BY COMPUESTO (Agrupando por dos o más categorías)
-- ¿Cuánto se vendió por Ciudad y, dentro de cada ciudad, por Género?
SELECT 
    City,
    Gender,
    SUM(Total) AS Ingresos
FROM Ventas
GROUP BY City, Gender; 
-- Ambas columnas deben ir en el GROUP BY separadas por coma.

-- ==============================================================================

-- 4. MEZCLANDO WHERE CON GROUP BY
-- Queremos saber el total vendido por Línea de Producto, 
-- PERO solo tomando en cuenta las ventas hechas a clientes "Member" (VIPs).
SELECT 
    Product_line,
    SUM(Total) AS Ingresos_Miembros
FROM Ventas
WHERE Customer_type = 'Member'  -- El filtro de fila ocurre primero
GROUP BY Product_line;          -- Luego agrupamos lo que sobrevivió al filtro