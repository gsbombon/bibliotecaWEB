/*¿Cuantos libros hay en la biblioteca?*/
SELECT COUNT(CODIGO_LIBRO) FROM LIBRO;
/*¿Cuánto ejemplares hay en la biblioteca?*/
SELECT COUNT(CODIGO_EJEMPLAR) AS numero_ejemplares FROM EJEMPLAR;
/*¿Cuántos libros editados por norma fueron prestados?*/
SELECT * FROM PRESTAMO 
WHERE CODIGO_LIBRO 
IN (SELECT CODIGO_LIBRO FROM LIBRO WHERE UPPER(EDITORIAL_LIBRO) LIKE 'NORMA');
/*¿Cuáles son los nombres de los libros cuyo total de ejemplares estan nuevos (sin deteriorar)?*/
SELECT ej.CODIGO_LIBRO, li.TITULO_LIBRO FROM EJEMPLAR ej, LIBRO li 
WHERE ej.CODIGO_LIBRO = li.CODIGO_LIBRO
AND ej.CODIGO_LIBRO 
NOT IN (SELECT ej.CODIGO_LIBRO from EJEMPLAR WHERE ej.DETERIORADO = 1);