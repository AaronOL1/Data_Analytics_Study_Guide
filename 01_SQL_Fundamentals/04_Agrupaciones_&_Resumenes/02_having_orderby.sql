/* ==============================================================================
   CURSO CEC - CLASE 06: HAVING Y ORDER BY
   Autor: Aaron Olmedo
============================================================================== */

USE SupermercadoDB;
GO

-- 1. EL USO BÁSICO DE HAVING
-- ¿Qué ciudades generaron ingresos totales superiores a 100,000 dólares?
SELECT 
    City, 
    SUM(Total) AS Ingreso_Total
FROM Ventas
GROUP BY City
HAVING SUM(Total) > 100000; 
-- Usamos HAVING porque estamos filtrando el resultado de una suma (SUM).

-- ==============================================================================

-- 2. EL COMBO LETAL: WHERE + GROUP BY + HAVING
-- Queremos saber qué sucursales (Branch) vendieron más de 50,000 dólares...
-- PERO solo tomando en cuenta las compras hechas en Efectivo (Cash).

SELECT 
    Branch, 
    SUM(Total) AS Total_Efectivo
FROM Ventas
WHERE Payment = 'Cash'          -- 1ro: Filtramos fila por fila (Solo efectivo)
GROUP BY Branch                 -- 2do: Agrupamos las ventas que sobrevivieron
HAVING SUM(Total) > 50000;      -- 3ro: Filtramos los grupos (Solo los > 50k)

-- ==============================================================================

-- 3. ORDENANDO CON ORDER BY (DESC Y ASC)
-- Queremos ver las 5 facturas más altas de toda la base de datos.
SELECT TOP 5 
    Invoice_ID, 
    City, 
    Total
FROM Ventas
ORDER BY Total DESC; -- DESC pone los números mayores arriba.

-- ==============================================================================

-- 4. LA CONSULTA MAESTRA (Todos los comandos juntos)
-- "Tráeme las Líneas de Producto que hayan vendido más de 300 unidades en total,
-- excluyendo a la ciudad de Yangon, y ordénalas de la que más vendió a la que menos."

SELECT 
    Product_line, 
    SUM(Quantity) AS Total_Unidades_Vendidas
FROM Ventas
WHERE City != 'Yangon'                  -- != significa "Diferente de"
GROUP BY Product_line
HAVING SUM(Quantity) > 300
ORDER BY Total_Unidades_Vendidas DESC;  -- Podemos ordenar usando el Alias