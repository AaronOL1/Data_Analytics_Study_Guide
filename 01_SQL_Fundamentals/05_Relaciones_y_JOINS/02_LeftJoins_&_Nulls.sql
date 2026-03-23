/* ==============================================================================
   CURSO CEC - CLASE 08: LEFT JOIN Y MANEJO DE NULLs
   Autor: Aaron Olmedo
============================================================================== */

USE SupermercadoDB;
GO

-- 1. EL PROBLEMA DEL INNER JOIN (Recordatorio)
-- Esto oculta las ventas de la sucursal 'C' porque no tiene gerente registrado.
SELECT v.Invoice_ID, v.Branch, s.Nombre_Gerente, v.Total
FROM Ventas v
INNER JOIN Info_Sucursales s ON v.Branch = s.Branch;

-- ==============================================================================

-- 2. LA SOLUCIÓN: LEFT JOIN
-- Queremos ver TODAS las facturas de la tabla Ventas (nuestra tabla "Izquierda").
-- Si no hay gerente, que simplemente diga NULL, pero que no borre mi venta.

SELECT 
    v.Invoice_ID, 
    v.Branch, 
    s.Nombre_Gerente, 
    v.Total
FROM Ventas v
LEFT JOIN Info_Sucursales s 
    ON v.Branch = s.Branch;

-- Verás que ahora las ventas de la sucursal 'C' sí aparecen, 
-- pero la columna 'Nombre_Gerente' muestra la palabra NULL.

-- ==============================================================================

-- 3. ENCONTRANDO INCONSISTENCIAS CON LEFT JOIN
-- Un truco avanzado de analista: usar LEFT JOIN + WHERE NULL para encontrar 
-- datos "huérfanos" o errores en la base de datos.
-- "Muestrame las ventas que NO tienen una sucursal registrada en el sistema de gerentes."

SELECT 
    v.Invoice_ID, 
    v.Branch, 
    v.Total
FROM Ventas v
LEFT JOIN Info_Sucursales s 
    ON v.Branch = s.Branch
WHERE s.Nombre_Gerente IS NULL; 
-- Esto es letal para auditorías de bases de datos.