# 📊 CLASE 05: De Filas a Resúmenes (Funciones de Agregación y GROUP BY)
**Tema:** DML - Cómo calcular totales, promedios y conteos.

Hasta ahora, nuestras consultas (SELECT) nos devolvían filas individuales (ej. cada factura por separado). Pero en el análisis de datos real, los gerentes no quieren ver 10,000 facturas; quieren ver el **total vendido por mes** o el **promedio de venta por ciudad**. Aquí entran las funciones de agregación. 

## 1. Funciones de Agregación (Maths en SQL)
Son funciones que toman múltiples filas y devuelven un solo número calculando algo:
* `COUNT(columna)`: Cuenta cuántas filas hay. (Ej. Número de transacciones).
* `SUM(columna)`: Suma los valores numéricos. (Ej. Total de ingresos).
* `AVG(columna)`: Calcula el promedio. (Ej. Ticket promedio de compra).
* `MAX(columna)` / `MIN(columna)`: Encuentra el valor máximo o mínimo.

## 2. La magia del GROUP BY
Si usas un `SUM()` sin nada más, SQL te dará el total de TODA la tabla. Pero si quieres el total **separado por categorías** (ej. Ventas *por Ciudad*), necesitas la cláusula `GROUP BY`.

> **🚨 LA REGLA DE ORO DEL GROUP BY (¡Pregunta de entrevista!):**
> Toda columna que pongas en tu `SELECT` y que **NO** tenga una función matemática (SUM, COUNT, etc.), tiene que ir obligatoriamente escrita en el `GROUP BY`. De lo contrario, SQL te arrojará un error.

## 3. El orden correcto de la consulta hasta ahora
A medida que sumamos comandos, SQL exige un orden estricto de escritura:
1. `SELECT` (Qué quiero ver y calcular)
2. `FROM` (De qué tabla)
3. `WHERE` (Filtros antes de agrupar)
4. `GROUP BY` (Cómo lo agrupo)