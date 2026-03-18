/* ==============================================================================
   CURSO CEC - CLASE 04: CONSULTAS Y FILTROS AVANZADOS (DML)
   Autor: Aaron Olmedo
============================================================================== */

USE SupermercadoDB;
GO

-- 1. SELECT, AS y DISTINCT
-- Traer columnas específicas y renombrarlas para el reporte
SELECT 
    Invoice_ID AS 'Codigo_Factura', 
    City AS 'Ciudad_Venta', 
    Total 
FROM Ventas;

-- Ver los valores únicos (¿Qué tipos de clientes tenemos?)
SELECT DISTINCT Customer_type 
FROM Ventas;

-- ==============================================================================

-- 2. WHERE con AND / OR
-- Buscar ventas grandes en una ciudad específica
SELECT * FROM Ventas 
WHERE City = 'Yangon' AND Total > 500;

-- Buscar ventas usando paréntesis para agrupar lógica
-- (Que sea en Yangon O Mandalay) Y que hayan pagado con Efectivo
SELECT * FROM Ventas 
WHERE (City = 'Yangon' OR City = 'Mandalay') 
  AND Payment = 'Cash';

-- ==============================================================================

-- 3. BETWEEN e IN
-- Rango de precios: Facturas que sumen entre 300 y 500 dólares
SELECT Invoice_ID, City, Total 
FROM Ventas 
WHERE Total BETWEEN 300 AND 500;

-- Conjuntos: Clientes que compraron en la línea de Deportes o Salud
SELECT Invoice_ID, Product_line 
FROM Ventas 
WHERE Product_line IN ('Sports and travel', 'Health and beauty');

-- El caso contrario: Todo MENOS esas dos categorías
SELECT Invoice_ID, Product_line 
FROM Ventas 
WHERE Product_line NOT IN ('Sports and travel', 'Health and beauty');

-- ==============================================================================

-- 4. Búsqueda de Texto con LIKE
-- Buscar cualquier producto que contenga la palabra "accessories"
SELECT Invoice_ID, Product_line 
FROM Ventas 
WHERE Product_line LIKE '%accessories%';

-- Buscar IDs de factura que terminen en un número específico (ej. terminan en 9)
SELECT Invoice_ID, Total 
FROM Ventas 
WHERE Invoice_ID LIKE '%9';