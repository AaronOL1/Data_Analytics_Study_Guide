# 🔍 CLASE 04: DML - Consultas y Filtros Avanzados
**Tema:** Data Manipulation Language (SELECT, WHERE y Operadores)

Una vez que la base de datos está llena, el trabajo del analista es hacerle preguntas correctas. Aquí es donde entra el comando `SELECT` y sus filtros.

## 1. Lo básico: SELECT, AS y DISTINCT
* `SELECT *`: Trae todas las columnas de la tabla.
* `AS`: Sirve para ponerle un "apodo" (alias) a una columna solo para esa consulta. Ayuda a que los reportes sean más legibles.
* `DISTINCT`: Elimina los duplicados en el resultado. Ideal para responder preguntas como: *"¿En cuántas ciudades distintas operamos?"*.

## 2. Filtrando filas: La cláusula WHERE
El `WHERE` es el filtro principal. Nos permite poner condiciones lógicas (`=`, `>`, `<`, `<=`, `>=`).
Para combinar condiciones usamos:
* `AND`: Las filas deben cumplir **todas** las condiciones.
* `OR`: Las filas deben cumplir **al menos una** condición.
*(💡 Consejo: Usa paréntesis `()` cuando mezcles AND y OR para que SQL entienda el orden correcto matemático).*

## 3. Operadores Especiales (BETWEEN e IN)
Para no escribir condiciones larguísimas, SQL tiene atajos:
* `BETWEEN`: Filtra valores dentro de un rango (incluye los límites). Perfecto para fechas o rangos de precios.
* `IN / NOT IN`: Filtra buscando dentro de una lista exacta. Es el reemplazo perfecto para no escribir múltiples `OR`.

## 4. El Buscador Mágico: LIKE (%)
Se usa para buscar patrones de texto, no palabras exactas. El símbolo `%` representa "cualquier cantidad de caracteres".
* `'A%'`: Todo lo que **empiece** con A.
* `'%A'`: Todo lo que **termine** con A.
* `'%palabra%'`: Todo lo que **contenga** esa palabra en cualquier parte.