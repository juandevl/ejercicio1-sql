--SELECT * FROM ESTILOS;
--SELECT * FROM DISCOS;
--SELECT * FROM ESTILOS;
--SELECT * FROM TIPOSEDICION;
--SELECT * FROM DISCOS;

--############Consigna 1:
--Traer todos los discos con su respectivo estilo. La consulta debe mostrar: Nombre de disco, Fecha de lanzamiento, Estilo (no el id, sino la descripción).
SELECT D.Titulo AS NombreDisco,
		D.FechaLanzamiento,
		E.Descripcion AS Estilo
FROM DISCOS D
JOIN ESTILOS E ON D.IdEstilo = E.Id;

--############Consigna 2:
--Insertar al menos dos estilos nuevos y un tipo de edicion de disco.
INSERT INTO ESTILOS VALUES ('Funk');
INSERT INTO ESTILOS VALUES ('Soul');
INSERT INTO ESTILOS VALUES ('Electronic');
INSERT INTO ESTILOS VALUES ('Progressive');
INSERT INTO ESTILOS VALUES ('Retro');
INSERT INTO ESTILOS VALUES ('Jazz');
INSERT INTO ESTILOS VALUES ('Rap');
INSERT INTO ESTILOS VALUES ('Fusion');
--Hecho!!!

--############Consigna 3:
--Insertar al menos dos discos nuevos cargando correctamente su informacion
INSERT INTO DISCOS 
    VALUES ('Midnight Grooves', 
            SMALLDATETIMEFROMPARTS(2020,04,15,00,00), 
            12, 'midnight_grooves.jpg', 
            (SELECT Id FROM ESTILOS WHERE Descripcion = 'Soul'), 
            (SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'Vinilo'));
INSERT INTO DISCOS 
  VALUES ('Ecliptic Echoes', 
          SMALLDATETIMEFROMPARTS(2018,09,23,00,00), 
          8, 
          'ecliptic_echoes.jpg', 
          (SELECT Id FROM ESTILOS WHERE Descripcion = 'Electronic'), 
          (SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'CD'));
INSERT INTO DISCOS 
	VALUES ('Retro Reverie', 
			SMALLDATETIMEFROMPARTS(2021,07,08,00,00), 
			10, 
			'retro_retrieve.jpg', 
			(SELECT Id FROM ESTILOS WHERE Descripcion = 'Retro'), 
			(SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'Tape'));
INSERT INTO DISCOS
VALUES ('Harmony Horizon', 
		SMALLDATETIMEFROMPARTS(2019,12,05,00,00), 
		14, 
		'harmony_horizon.jpg', 
		(SELECT Id FROM ESTILOS WHERE Descripcion = 'Pop'), 
		(SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'Vinilo'));
INSERT INTO DISCOS 
VALUES ('Cosmic Serenade', 
		SMALLDATETIMEFROMPARTS(2022,02,28,00,00), 
		9, 
		'cosmic_serenade.jpg', 
		(SELECT Id FROM ESTILOS WHERE Descripcion = 'Progressive'), 
		(SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'CD'));
INSERT INTO DISCOS 
VALUES ('Soulful Sanctuary', 
		SMALLDATETIMEFROMPARTS(2017,06,12,00,00), 
		11, 
		'soulful_sanctuary.jpg', 
		(SELECT Id FROM ESTILOS WHERE Descripcion = 'Jazz'), 
		(SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'Vinilo'));
INSERT INTO DISCOS 
VALUES ('Urban Utopia', 
		SMALLDATETIMEFROMPARTS(2020,10,20,00,00), 
		13, 
		'urban_utopia.jpg', 
		(SELECT Id FROM ESTILOS WHERE Descripcion = 'Rap'), 
		(SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'CD'));
INSERT INTO DISCOS 
VALUES ('Mystic Mirage', 
		SMALLDATETIMEFROMPARTS(2016,03,17,00,00), 
		7, 
		'mystic_mirage.jpg', 
		(SELECT Id FROM ESTILOS WHERE Descripcion = 'Fusion'), 
		(SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'Vinilo'));
INSERT INTO DISCOS 
VALUES ('Techno Twilight', 
		SMALLDATETIMEFROMPARTS(2023,05,11,00,00), 
		15, 
		'techno_twilight.jpg', 
		(SELECT Id FROM ESTILOS WHERE Descripcion = 'Electronic'), 
		(SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'CD'));
INSERT INTO DISCOS 
VALUES ('Jazz Jamboree', 
		SMALLDATETIMEFROMPARTS(2018,08,03,00,00), 
		6, 
		'jazz_jamboree.jpg', 
		(SELECT Id FROM ESTILOS WHERE Descripcion = 'Jazz'), 
		(SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'Vinilo'));
--Hecho!!

--############Consigna 4:
--Actualizar al menos un disco modificando la cantidad de canciones
--y la fecha de lanzamiento. No te olvides del Where
UPDATE DISCOS
SET CantidadCanciones = 20, FechaLanzamiento = SMALLDATETIMEFROMPARTS(2023,12,31,0,0)
WHERE Id = (SELECT Id FROM DISCOS WHERE Titulo = 'Jazz Jamboree');
SELECT * FROM DISCOS;

UPDATE TIPOSEDICION SET Descripcion = 'Tape' WHERE Descripcion = 'Cassette';
UPDATE DISCOS 
	SET IdTipoEdicion = (SELECT Id FROM TIPOSEDICION WHERE Descripcion = 'Tape')
	WHERE Titulo = 'Retro Reverie';


--#############Consigna 5:
--Eliminar un disco a eleccion
DELETE FROM DISCOS WHERE Titulo = 'Harmony Horizon';

--############# Consigna6:
--Traer todos los estilos que estén asociados a algún disco.

SELECT DISTINCT E.Id, E.Descripcion
FROM ESTILOS E
JOIN DISCOS D ON E.Id = D.IdEstilo;
-- SELECT * FROM ESTILOS;

--##########Consigna 7:
--Traer todos los discos con el siguiente formato: Nombre, Estilo, Edicion (Todo Texto)
SELECT D.Titulo AS Nombre,
		E.Descripcion AS Estilo,
		T.Descripcion AS Edicion
FROM DISCOS D
JOIN ESTILOS E ON D.IdEstilo = E.Id
JOIN TIPOSEDICION T ON D.IdTipoEdicion = T.Id;

--###########Consigna 8:
--Traer todos los discos que contengan en su nombre la silaba "ho".
--El simbolo '%ho%' representa: Trae toda la informacion
--sin importar como empiece (el primer %) ni como termine (el ultimo %)
--que contenga en el medio la silaba "ho"
SELECT * FROM DISCOS WHERE Titulo LIKE '%ho%';
--SELECT * FROM DISCOS;

