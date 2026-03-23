/* ==============================================================================
   CURSO CEC - CLASE 06: HAVING Y ORDER BY
   Autor: Aaron Olmedo
============================================================================== */

USE SupermercadoDB;
GO

-- 1. EL ERROR COMÚN (WHERE vs HAVING)
-- Queremos saber qué líneas de producto generaron más de 15,000 dólares.

-- FORMA CORRECTA:
SELECT 
    Product_line,
    SUM(Total) AS Ingreso_Total
FROM Ventas
GROUP BY Product_line
HAVING SUM(Total) > 15000; -- Filtramos el resultado de la suma

-- ==============================================================================

-- 2. ORDENANDO LOS RESULTADOS (ORDER BY)
-- Queremos ver TODAS las líneas de producto, ordenadas de la que más vendió a la que menos.

SELECT 
    Product_line,
    SUM(Total) AS Ingreso_Total
FROM Ventas
GROUP BY Product_line
ORDER BY Ingreso_Total DESC; -- DESC para ver el mayor arriba

-- ==============================================================================

-- 3. LA CONSULTA MAESTRA (Usando todo el orden estricto de SQL)
-- "Muestrame el total vendido por Ciudad, SOLO de clientes femeninas, 
--  que hayan generado más de 50,000 en total, ordenado de mayor a menor."

SELECT 
    City,
    SUM(Total) AS Ventas_Mujeres
FROM Ventas
WHERE Gender = 'Female'        -- 1. Filtramos las filas originales
GROUP BY City                  -- 2. Agrupamos por ciudad
HAVING SUM(Total) > 50000      -- 3. Filtramos los grupos resultantes
ORDER BY Ventas_Mujeres DESC;  -- 4. Ordenamos el reporte final