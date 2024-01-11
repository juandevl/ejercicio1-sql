
--LEER DATOS

--SELECT nombre_columna FROM nombre_tabla WHERE (filtro) nombre_columna = valor_a_filtrar

SELECT id FROM ESTILOS where Descripcion = 'Rock';
SELECT * FROM DISCOS;
SELECT * FROM ESTILOS;
SELECT * FROM TIPOSEDICION;

--INSERTAR DATOS
-- INSERT INTO nombre_tabla (opcional=> nombre_columna1, nombre_columna2, ...) VALUES (valor_columna1, valor_columna2, ...)

INSERT INTO DISCOS 
VALUES ('Amapola del 66', 
		SMALLDATETIMEFROMPARTS(2010,10,6,12,45), 12, 
		'amapoladel66.jpg', 
		(SELECT Id FROM ESTILOS WHERE Descripcion = 'Rock'),
		(SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'CD'));

--############ Otra funcion para obtener la fecha es: getdate()

--INSERT INTO ESTILOS
--VALUES ('Folklore');

--MODIFICAR REGISTRO

--Sentencia UPDATE nombre_tabla SET nombre_columna = valor_a_cargar WHERE (filtro para no modificar toda la tabla) nombre_identificador = valor_buscado
UPDATE TIPOSEDICION SET Descripcion = 'Cassette' WHERE Id = 3;

--ELIMINAR DE LA TABLA

DELETE FROM ESTILOS WHERE Descripcion = 'Folklore';

