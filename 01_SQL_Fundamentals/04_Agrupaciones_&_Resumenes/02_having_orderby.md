# ⚖️ CLASE 06: Filtrando Grupos (HAVING) y Ordenando Resultados (ORDER BY)
**Tema:** DML - Refinando nuestros resúmenes y dándoles formato.

En la clase anterior aprendimos a agrupar datos con `GROUP BY`. Pero, ¿qué pasa si queremos filtrar esos grupos? Por ejemplo, no queremos ver todas las sucursales, solo aquellas que vendieron más de $10,000. Aquí es donde entra el temido `HAVING`. [Image of SQL HAVING vs WHERE clause diagram]

## 1. El filtro de los grupos: HAVING
Así como el `WHERE` filtra filas individuales, el `HAVING` filtra **grupos ya creados**. 
* Si la condición usa una función matemática (como `SUM`, `COUNT`, `AVG`), **OBLIGATORIAMENTE** debes usar `HAVING`.
* El `HAVING` siempre se escribe **después** del `GROUP BY`.

## 2. La Pregunta del Millón: ¿WHERE vs HAVING?
Esta es la típica pregunta de prueba técnica para analistas de datos. La diferencia está en **cuándo** se ejecuta el filtro:
* **`WHERE`**: Actúa PRIMERO. Filtra las filas individuales de la tabla original antes de que se haga cualquier cálculo.
* **`HAVING`**: Actúa DESPUÉS. Revisa los grupos que ya se formaron y decide cuáles se quedan en el reporte final.

## 3. Poniendo orden: ORDER BY
De nada sirve un reporte si los datos están desordenados. `ORDER BY` es el último comando que se ejecuta en una consulta y sirve para ordenar el resultado final.
* `ASC`: Ascendente (A-Z, 0-9). Es el valor por defecto si no escribes nada.
* `DESC`: Descendente (Z-A, 9-0). Ideal para ver los "Top 10" o los valores más altos primero.

## 📌 La Estructura Definitiva (El "Jefe Final" de una consulta)
El orden estricto que exige SQL cuando usamos todos los comandos juntos es:
1. `SELECT`
2. `FROM`
3. `WHERE`
4. `GROUP BY`
5. `HAVING`
6. `ORDER BY`

Ya sabemos agrupar, pero ¿qué pasa si queremos filtrar esos grupos? Aquí es donde muchos analistas junior se equivocan intentando usar el `WHERE`.

## 1. La diferencia vital: WHERE vs HAVING
Ambos sirven para filtrar, pero actúan en momentos diferentes del motor de SQL:
* **`WHERE`**: Filtra **filas individuales** ANTES de que se agrupen. (Ej. Solo ventas del 2023). No permite funciones matemáticas.
* **`HAVING`**: Filtra **los grupos ya creados** DESPUÉS del `GROUP BY`. (Ej. Solo las sucursales cuya suma total de ventas supere los $10,000).

## 2. ORDER BY (El toque final)
Un reporte no sirve si está desordenado. `ORDER BY` siempre es la **última línea** de tu consulta SQL.
* `ASC`: Ascendente (De A-Z, o de menor a mayor). Es el valor por defecto.
* `DESC`: Descendente (De Z-A, o de mayor a menor). Muy usado para ver los "Top 5" o "Top 10" de ventas.