--Base de Datos
--Boletín 7.4: SQL LMD
--Utilizando la base de datos Empresa, realizar las siguientes consultas:
USE Empresa
--Selección de campos
--1. Escribir una consulta para ver el nombre de todos los clientes.
SELECT nombre FROM Clientes
--2. Realizar una consulta que muestre el nombre y número asignado a cada uno de los clientes disponibles en la base de datos.
SELECT nombre, numclie FROM Clientes
--3. Mostrar para todos los empleados su nombre, puesto y edad.
SELECT nombre, puesto, edad FROM Empleados
--4. Realizar un informe de la edad, nombre y puesto de todos los empleados.
SELECT edad, nombre, puesto FROM Empleados
--5. Para las oficinas mostrar su número identificador, ciudad y región.
SELECT oficina, ciudad, region FROM Oficinas

--Renombrado de campos
--6. Igual que el ejercicio anterior, pero en lugar de utilizar como nombre del campo ciudad utilizaremos Localidad.
SELECT oficina, ciudad AS [LOCALIDAD], region FROM Oficinas
--7. Mostrar todos los clientes y su límite de crédito. Como nombre de la cabecera deberá aparecer
--“Nombre del cliente” y “Crédito máximo”.
SELECT nombre AS [NOMBRE DEL CLIENTE], limitecredito AS [CREDITO MAXIMO] FROM Clientes

--Seleccionar todos los campos
--8. Mostrar todos los datos de la tabla Clientes.
SELECT * FROM Clientes
--9. Mostrar todos los datos de la tabla Empleados.
SELECT * FROM Empleados
--10. Mostrar todos los datos de la tabla Oficinas.
SELECT * FROM Oficinas

--Ordenación de consultas
--11. Obtener la lista de clientes ordenados por su nombre. Visualizar todas las columnas de la tabla.
SELECT * FROM Clientes ORDER BY nombre
--12. Obtener las oficinas ordenadas por región y dentro de cada región por ciudad, si hay más de una
--oficina en la misma ciudad, aparecerá primero la que tenga el número de oficina mayor.
SELECT * FROM Oficinas ORDER BY region, ciudad, oficina DESC
--13. Obtener los pedidos ordenados por la fecha en la que se realizaron.
SELECT * FROM Pedidos ORDER BY fechapedido

--Limitación del número de resgistros
--14. Listar los cuatro pedido más caros (con un importe mayor).
GO
SELECT TOP (4) * FROM Pedidos ORDER BY importe DESC
GO
--15. Obtener el número del cliente que hizo el primer pedido.
SELECT TOP (1) clie FROM Pedidos ORDER BY fechapedido 
--16. Obtener el nombre del empleado de menor edad.
SELECT TOP(1) nombre FROM Empleados ORDER BY edad 

--Operadores aritméticos
--17. Siempre he tenido la duda de saber cuanto es siete más tres.
SELECT (7+3) AS [SUMA 7 + 3]
--18. Mostrar del empleado más joven, su edad actual y la edad que tendrá el año que viene.
SELECT edad, (edad + 1) AS [EDAD EL AÑO QUE VIENE] FROM Empleados
--19. Mostrar los clientes, suponiendo que aumentamos su límite de crédito en 500 euros.
SELECT numclie,nombre, resp,(limitecredito + 500) AS [limitecreditoEditado] FROM Clientes
--20. Obtener la lista de todos los productos, indicando para cada uno: idfab, idproducto, descripción,
--precio y precio con I.V.A. incluido (es el precio anterior aumentado en un 21%).
SELECT idfab, idproducto, descripcion, precio, ((precio * 0.21)+precio) AS [PRECIO CON IVA] FROM Productos
--21. De cada pedido queremos saber su número, la fecha en la que se realizó, cantidad pedida, el precio
--unitario de cada producto y el importe total.
SELECT numpedido, fechapedido, cant, (importe / cant) AS [PRECIO UNITARIO], SUM(importe) AS [IMPORTE TOTAL] FROM Pedidos GROUP BY numpedido, fechapedido, cant, importe / cant, importe
--22. Obtener el número de pedido, fab, producto, cantidad, precio unitario e importe pero mostrando
--únicamente los tres pedidos de menor precio unitario.
SELECT TOP(3) numpedido, fab, producto, cant, (importe / cant) AS [PRECIO UNITARIO], importe  FROM Pedidos ORDER BY [PRECIO UNITARIO]

--Funciones de fecha
--23. ¿Cuál es la fecha de hoy?
SELECT CURRENT_TIMESTAMP AS [FECHA DE HOY]
--24. Mostrar el més actual.
SELECT MONTH(CURRENT_TIMESTAMP) AS [MES ACTUAL]
--25. ¿Qué día de la semana es hoy?
SELECT DAY(CURRENT_TIMESTAMP) AS [DIA DE LA SEMANA ACTUAL]
--26. Si tienes 25 años, ¿en qué año naciste?
SELECT YEAR(CURRENT_TIMESTAMP) - 25 AS [SI TIENES 25 AÑOS NACISTE EN EL ...]
--27. Y si naciste en el año 2000, ¿cuántos años tienes?
SELECT DATEDIFF (YEAR,'20000101',CURRENT_TIMESTAMP) AS [SI NACISTES EN EL 2000 TIENES ...]
--28. Para todos los pedidos, mostrar el número de pedido, el importe, el día de la semana y el mes en
--el que se realizó.
SELECT numpedido, importe, DATEPART(WEEKDAY,fechapedido) AS [DIA DE LA SEMANA], MONTH(fechapedido) AS MES FROM Pedidos
--29. Listar de cada empleado su nombre, nº de días que lleva trabajando en la empresa y su año de
--nacimiento (suponiendo que este año ya ha cumplido años).
SELECT nombre, DATEDIFF(DAY, contrato, CURRENT_TIMESTAMP) AS [Nº DE DIAS TRABAJADOS], Year(CURRENT_TIMESTAMP)- edad AS [AÑO DE NACIMIENTO] FROM Empleados
--30. Para cada pedido mostrar sus datos y el número de días transcurrido desde que se realizó hasta
--hoy.
SELECT *, DATEDIFF(DAY, fechapedido, CURRENT_TIMESTAMP) AS [Nº DE DIAS TRANSCURRIDOS] FROM Pedidos
--31. Obtener la fecha actual, en formato “(<nombre_día>) <día> de <nombre_mes> del año <año>”.
--Un ejemplo:
--(jueves) 7 de septiembre del año 2017
SELECT (CASE DATEPART(DW,CURRENT_TIMESTAMP)WHEN 2 THEN 'Lunes' WHEN 3 THEN 'Martes' WHEN 4 THEN 'Miércoles' WHEN 5 THEN 'Jueves' WHEN 6 THEN 'Viernes' WHEN 7 THEN 'Sábado' WHEN 1 THEN 'Domingo' END) AS [NOMBRE DIA DE LA SEMANA], DAY(CURRENT_TIMESTAMP) AS DIA, (CASE DATEPART(WW,CURRENT_TIMESTAMP)WHEN 1 THEN 'ENERO'  WHEN 2 THEN 'FEBRERO' WHEN 3 THEN 'MARZO' WHEN 4 THEN 'ABRIL' WHEN 5 THEN 'MAYO' WHEN 6 THEN 'JUNIO' WHEN 7 THEN 'JULIO'  WHEN 8 THEN 'AGOSTO' WHEN 9 THEN 'SEPTIEMBRE' WHEN 10 THEN 'OCTUBRE' WHEN 11 THEN 'NOVIEMBRE' WHEN 12 THEN 'DICIEMBRE' END) AS [NOMBRE MES], YEAR(CURRENT_TIMESTAMP) AS [AÑO]
--32. Mostrar la información de todos los pedidos junto a la fecha en la que se realizaron, con el formato
--del ejercicio anterior.
SELECT * FROM Pedidos
--33. Obtener la hora actual con el formato “Las <hora> horas y <minutos> minutos”. Un ejemplo:
--Las 10 horas y 54 minutos
SELECT CONCAT('LAS ', DATEPART(HOUR,CURRENT_TIMESTAMP), ' HORAS Y ', DATEPART(MINUTE, CURRENT_TIMESTAMP),' MINUTOS.') AS [HORA ACTUAL]

--Funciones de cadena
--34. ¿Cuál es la longitud de tu nombre?
PRINT LEN('LUIS')
--35. Mostrar junto al nombre de cada empleado el número de carácteres que lo componen.
SELECT nombre, LEN(nombre) AS [NUMERO DE CARACTERES] FROM Empleados
--36. Listar el nombre de los clientes anteponiendo la cadena “Don”.
SELECT CONCAT('DON ',nombre)  FROM Clientes
--37. Mostrar el nombre de cada cliente sustituyendo la letra e por el símbolo @.
SELECT REPLACE(nombre, 'e', '@')  FROM Clientes 
--38. Mostrar los primeros diez caracteres a la derecha de la frase: “Mi perro se llama Perico Pérez”.
PRINT SUBSTRING ('Mi perro se llama Perico Pérez', 0, 10)
--39. Para cada empleado mostrar su nombre, número de empleado y su puesto de la forma: “Trabaja
--de ...” añadiendo el puesto correspondiente. El nombre de la última columna debe ser “Categoría”.
SELECT nombre, COUNT(*) AS [Nº EMPLEADOS], CONCAT('TRABAJA DE ', puesto) AS CATEGORIA FROM Empleados GROUP BY nombre, puesto
--40. Igual que el ejercicio anterior pero cambiando el puesto de “Representante” por el de “Comercial”.
SELECT nombre, COUNT(*) AS [Nº EMPLEADOS], CONCAT('TRABAJA DE ', REPLACE(puesto, 'Representante', 'Comercial')) AS CATEGORIA FROM Empleados GROUP BY nombre, puesto
--41. Para cada producto obtener sus datos. Por no hacer muy largo el informe mostrar de la descripción
--solo los primeros 8 caracteres.
SELECT idfab,idproducto,SUBSTRING(descripcion,0,8) AS DESCRIPCION, precio, existencias FROM Productos

--Condicionales
--42. Mostrar los empleados cuya edad sea igual a 29 años;
SELECT * FROM Empleados WHERE edad = 29
--43. Listar toda la información de los pedidos de enero.
SELECT * FROM Pedidos WHERE MONTH(fechapedido) = 1
--44. Listar toda la información de los pedidos con un mes distinto a enero.
SELECT * FROM Pedidos WHERE MONTH(fechapedido) <> 1
--45. Listar los números de los empleados que tienen una oficina asignada.
SELECT * FROM Empleados WHERE oficina IS NOT NULL
--46. Listar los números de los empleados que no tienen una oficina asignada y tienen más de 30 años.
SELECT * FROM Empleados WHERE oficina IS NULL AND edad > 30
--47. Listar los números de las oficinas que no tienen director.
SELECT * FROM Oficinas WHERE dir IS NULL
--48. Listar los datos de las oficinas de las regiones del norte y del este (tienen que aparecer primero las
--del norte y después las del este).
SELECT * FROM Oficinas WHERE region LIKE 'este' OR region LIKE 'norte' ORDER BY region DESC
--49. Mostrar la información de los empleados que trabajan en las oficinas 11, 12, 23 o 24.
SELECT * FROM Empleados WHERE oficina IN (11,12,23,24)
--50. Listar los empleados cuyo nombre contengan una ‘r’.
SELECT * FROM Empleados WHERE nombre LIKE '%r%'
--51. Mostrar los empleados cuyo apellido o segundo nombre comiencen por una ‘V’.
SELECT * FROM Empleados WHERE nombre LIKE '_%V%'
--52. Listar los productos cuyo idproducto acabe en ‘x’.
SELECT * FROM Productos WHERE idproducto LIKE'%x'

--Consultas multitablas
--53. Mostrar la información de los empleados junto a la información de las oficinas en las que trabajan.
SELECT E.*, O.* FROM Empleados AS E INNER JOIN Oficinas AS O ON E.oficina = O.oficina
--54. Igual que el ejercicio anterior, pero mostrando solo los empleados que trabajan en las oficinas del
--sur.
SELECT E.*, O.* FROM Empleados AS E INNER JOIN Oficinas AS O ON E.oficina = O.oficina WHERE O.region LIKE 'sur'
--55. Igual que el ejercicio anterior, ordenando los empleados por edad.
SELECT E.*, O.* FROM Empleados AS E INNER JOIN Oficinas AS O ON E.oficina = O.oficina ORDER BY E.edad
--56. Escribir una consulta que muestre la información de todos los empleados junto a los datos de su
--oficina.

--57. Escribir una consulta que muestre la información de todos los empleados (trabajen o no en una
--oficina) junto a la información de su oficina.
--58. Listar las oficinas del este indicando para cada una de ellas su número, ciudad, números y nombres de sus empleados. Hacer una versión en la que aparecen sólo las que tienen empleados, y
--hacer otra en las que además aparezcan las oficinas del este que no tienen empleados.
--59. Listar los pedidos mostrando su número de pedido e importe, junto a la información del cliente
--(nombre y límite de crédito) que realiza el pedido.