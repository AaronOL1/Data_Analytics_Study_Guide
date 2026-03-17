# 🏗️ CLASE 02: DDL - Creación de Bases de Datos y Tablas
**Tema:** Data Definition Language (CREATE)
**Dataset a utilizar:** Ventas Supermercado (`1. Ventas supermercado.csv`)

## 1. El Concepto de DDL
SQL se divide en varias "familias" de comandos. La primera que debemos conocer es el **DDL (Data Definition Language)**. Son los comandos que usamos para crear, modificar o destruir las estructuras (las tablas y bases de datos), NO los datos en sí.
* `CREATE`: Crea una base de datos o tabla nueva.
* `ALTER`: Modifica una tabla existente (ej. añadir o borrar una columna).
* `DROP`: Elimina por completo una tabla o base de datos.

## 2. Tipos de Datos (Data Types)
Antes de importar un archivo (como un CSV) a SQL, debemos "dibujar" la tabla. Para eso, debemos asignarle a cada columna un tipo de dato. Los más comunes en SQL Server son:
* `VARCHAR(n)`: Texto. La "n" es el número máximo de caracteres (ej. `VARCHAR(50)`).
* `INT`: Números enteros (sin decimales, ej. cantidades).
* `DECIMAL(p, s)`: Números con decimales. La "p" es el total de dígitos y la "s" cuántos de esos son decimales. *Ej. `DECIMAL(10,2)` significa 10 números en TOTAL, de los cuales 8 son enteros y 2 son decimales.*
* `DATE`: Fechas (AAAA-MM-DD).

> **💡 Nota del Analista:** Definir bien los tipos de datos desde el principio ahorra muchísimos dolores de cabeza (y espacio en memoria) cuando la base de datos crece a millones de registros.

---

# 📥 CLASE 03: Importación de Datos y Primeros Pasos con DML
**Tema:** Carga Masiva (Bulk Load) y Verificación de Datos

## 1. El Reto de la Importación (ETL Básico)
En el mundo real, los datos vienen en formatos planos como `.csv` o `.txt`. El proceso de meter esos datos a nuestra base SQL es el primer paso del **ETL** (Extract, Transform, Load).

> **🚨 Advertencia de la Vida Real:** Al inspeccionar nuestro CSV, notamos que usa punto y coma (`;`) para separar las columnas, y mezcla comas (`,`) y puntos (`.`) en los decimales. Si intentamos importar esto a la fuerza bruta, SQL arrojará errores de conversión.

## 2. Métodos de Importación en SQL Server
Existen dos formas principales de subir datos masivos:
1. **Por Código (`BULK INSERT`):** Es rapidísimo, pero requiere que el CSV esté perfectamente limpio y estandarizado.
2. **Por Asistente (SSMS Import Flat File Wizard):** Es la mejor opción para analistas. El asistente lee el archivo, detecta los delimitadores y hace la conversión de tipos de datos automáticamente.

### 🛠️ Paso a Paso del "Import Flat File" (SSMS)
Para documentar mi proceso, estos son los pasos que seguí en SQL Server Management Studio:
1. Clic derecho sobre la base de datos `SupermercadoDB`.
2. Seleccionar **Tasks** > **Import Flat File...**
3. Buscar el archivo `1. Ventas supermercado.csv`.
4. En "Preview Data", verificar que las columnas cuadren.
5. En "Modify Columns", el asistente mapea automáticamente los tipos de datos (Ej: de `nvarchar` a `float` o `date`).
6. Clic en "Finish".

---

# 🔍 PRIMERAS CONSULTAS (Introducción a DML)
Una vez que los datos están adentro, pasamos del DDL (Crear tablas) al **DML (Data Manipulation Language - Manipular datos)**. 

## La "Estructura Mágica" de SQL
Se debe saber que la estructura base y el **orden estricto** para toda consulta dentro de SQL es:

```sql
SELECT    -- ¿Qué columnas o cálculos quiero ver?
FROM      -- ¿De qué tabla saco los datos?
WHERE     -- ¿Qué condiciones/filtros le aplico a las filas?
GROUP BY  -- ¿Cómo agrupo los datos? (Ej. Por ciudad, por fecha)
HAVING    -- ¿Qué filtro le aplico a los grupos creados?
ORDER BY  -- ¿Cómo ordeno el resultado final? (ASC o DESC)

--
SELECT 
    variable_1,               -- Se pueden seleccionar varias variables separadas por coma (,)
    variable_2 
FROM tabla_1 
WHERE condicion_1 = 'Texto'   -- Se coloca la condición para filtrar filas
GROUP BY variable_1           -- Agrupa los resultados (requiere funciones como SUM, COUNT en el SELECT)
ORDER BY variable_2 DESC;     -- Ordena el resultado final (ASC para ascendente, DESC para descendente)