# 🔗 CLASE 07: Bases de Datos Relacionales y el INNER JOIN
**Tema:** Por qué separamos la información y cómo volverla a unir.

Hasta ahora hemos trabajado con una sola tabla plana (`Ventas`). Pero en el mundo real, las bases de datos tienen decenas de tablas conectadas entre sí. ¿Por qué? Para evitar repetir información y ahorrar memoria (un concepto llamado *Normalización*).

## 1. El Concepto: PK y FK
Para conectar dos tablas, necesitamos un "puente" o columna en común:
* **Primary Key (PK - Llave Primaria):** Es el identificador único de una tabla (ej. El ID del Cliente en la tabla `Clientes`). No se puede repetir.
* **Foreign Key (FK - Llave Foránea):** Es esa misma columna, pero viviendo como "invitada" en otra tabla (ej. El ID del Cliente dentro de la tabla `Ventas`).

## 2. ¿Qué es un JOIN?
Es la instrucción en SQL que nos permite "pegar" temporalmente las columnas de dos tablas diferentes usando ese puente (la PK y la FK) para armar nuestro reporte.

## 3. INNER JOIN (La Intersección Perfecta) 
Existen varios tipos de JOINs, pero el más usado es el `INNER JOIN`. 
* **¿Qué hace?** Busca coincidencias exactas. **SOLO** te devuelve las filas donde el "puente" existe en ambas tablas.
* Si un cliente está en la tabla `Clientes` pero NO tiene compras en la tabla `Ventas`, el `INNER JOIN` lo ignora y no lo muestra en el resultado final.

> **💡 Tip de Analista:** Cuando unes tablas, es muy común usar **Alias** en el nombre de las tablas (ej. `Ventas v`, `Clientes c`) para no tener que escribir el nombre completo cada vez que llamas a una columna.