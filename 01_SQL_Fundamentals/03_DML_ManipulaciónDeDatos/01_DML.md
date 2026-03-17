# ✍️ CLASE 03: DML - Manipulación de Datos (CRUD Básico)
**Tema:** INSERT, UPDATE, DELETE y el peligro de olvidar el WHERE.

Una vez que tenemos la tabla creada (DDL) o hemos hecho una carga masiva, toca aprender a manipular esos datos a mano. Estas son las operaciones básicas de escritura.

## 1. Insertar Datos (INSERT INTO)
Agrega nuevas filas a una tabla.
* **Buena práctica:** Especificar las columnas `(columna1, columna2)` garantiza que los datos caigan en el lugar correcto, incluso si la tabla cambia en el futuro.
* **Forma rápida:** Si omites los nombres de las columnas, debes insertar los valores en el **orden EXACTO** en que se creó la tabla. *(¡Cuidado con esto!)*

## 2. Actualizar Datos (UPDATE)
Modifica datos que ya existen. Ideal para corregir errores o actualizar estados.
> **🚨 ¡ALERTA ROJA DE LA VIDA REAL!** > Si ejecutas un `UPDATE` sin la cláusula `WHERE`, ¡cambiarás ese valor en TODAS las filas de la tabla! Siempre, SIEMPRE usa un `WHERE` con un identificador único (como el ID).

## 3. Eliminar Datos (DELETE vs DROP)
Es vital entender la diferencia entre vaciar una caja y destruir la caja:
* `DELETE FROM`: Elimina **las filas (los datos)**. La tabla sigue existiendo, pero vacía. *(Igual que en el UPDATE, si olvidas el WHERE, borrarás toda la información).*
* `DROP TABLE`: Comando DDL. Destruye **la estructura completa**. La tabla desaparece de la base de datos para siempre.

## 4. Operadores Lógicos (AND / OR)
Fundamentales para poner condiciones precisas en nuestros `WHERE`:
* `AND`: Exige que se cumplan **TODAS** las condiciones. (Ej. "Quiero que sea cliente VIP **Y** que viva en Quito").
* `OR`: Se cumple si **AL MENOS UNA** condición es verdadera. (Ej. "Que viva en Quito **O** en Guayaquil").