--Base de Datos
--Bolet�n 7.4: SQL LMD
--Utilizando la base de datos Empresa, realizar las siguientes consultas:
USE Empresa
--Selecci�n de campos
--1. Escribir una consulta para ver el nombre de todos los clientes.
SELECT nombre FROM Clientes
--2. Realizar una consulta que muestre el nombre y n�mero asignado a cada uno de los clientes disponibles en la base de datos.
SELECT nombre, numclie FROM Clientes
--3. Mostrar para todos los empleados su nombre, puesto y edad.
SELECT nombre, puesto, edad FROM Empleados
--4. Realizar un informe de la edad, nombre y puesto de todos los empleados.
SELECT edad, nombre, puesto FROM Empleados
--5. Para las oficinas mostrar su n�mero identificador, ciudad y regi�n.
SELECT oficina, ciudad, region FROM Oficinas

--Renombrado de campos
--6. Igual que el ejercicio anterior, pero en lugar de utilizar como nombre del campo ciudad utilizaremos Localidad.
SELECT oficina, ciudad AS [LOCALIDAD], region FROM Oficinas
--7. Mostrar todos los clientes y su l�mite de cr�dito. Como nombre de la cabecera deber� aparecer
--�Nombre del cliente� y �Cr�dito m�ximo�.
SELECT nombre AS [NOMBRE DEL CLIENTE], limitecredito AS [CREDITO MAXIMO] FROM Clientes

--Seleccionar todos los campos
--8. Mostrar todos los datos de la tabla Clientes.
SELECT * FROM Clientes
--9. Mostrar todos los datos de la tabla Empleados.
SELECT * FROM Empleados
--10. Mostrar todos los datos de la tabla Oficinas.
SELECT * FROM Oficinas

--Ordenaci�n de consultas
--11. Obtener la lista de clientes ordenados por su nombre. Visualizar todas las columnas de la tabla.
SELECT * FROM Clientes ORDER BY nombre
--12. Obtener las oficinas ordenadas por regi�n y dentro de cada regi�n por ciudad, si hay m�s de una
--oficina en la misma ciudad, aparecer� primero la que tenga el n�mero de oficina mayor.
SELECT * FROM Oficinas ORDER BY region, ciudad, oficina DESC
--13. Obtener los pedidos ordenados por la fecha en la que se realizaron.
SELECT * FROM Pedidos ORDER BY fechapedido

--Limitaci�n del n�mero de resgistros
--14. Listar los cuatro pedido m�s caros (con un importe mayor).
GO
SELECT TOP (4) * FROM Pedidos ORDER BY importe DESC
GO
--15. Obtener el n�mero del cliente que hizo el primer pedido.
SELECT TOP (1) clie FROM Pedidos ORDER BY fechapedido 
--16. Obtener el nombre del empleado de menor edad.
SELECT TOP(1) nombre FROM Empleados ORDER BY edad 

--Operadores aritm�ticos
--17. Siempre he tenido la duda de saber cuanto es siete m�s tres.
--18. Mostrar del empleado m�s joven, su edad actual y la edad que tendr� el a�o que viene.
--19. Mostrar los clientes, suponiendo que aumentamos su l�mite de cr�dito en 500 euros.
--20. Obtener la lista de todos los productos, indicando para cada uno: idfab, idproducto, descripci�n,
--precio y precio con I.V.A. incluido (es el precio anterior aumentado en un 21%).
--21. De cada pedido queremos saber su n�mero, la fecha en la que se realiz�, cantidad pedida, el precio
--unitario de cada producto y el importe total.
--22. Obtener el n�mero de pedido, fab, producto, cantidad, precio unitario e importe pero mostrando
--�nicamente los tres pedidos de menor precio unitario.

--Funciones de fecha
--23. �Cu�l es la fecha de hoy?
--24. Mostrar el m�s actual.
--25. �Qu� d�a de la semana es hoy?
--26. Si tienes 25 a�os, �en qu� a�o naciste?
--27. Y si naciste en el a�o 2000, �cu�ntos a�os tienes?
--28. Para todos los pedidos, mostrar el n�mero de pedido, el importe, el d�a de la semana y el mes en
--el que se realiz�.
--29. Listar de cada empleado su nombre, n� de d�as que lleva trabajando en la empresa y su a�o de
--nacimiento (suponiendo que este a�o ya ha cumplido a�os).
--30. Para cada pedido mostrar sus datos y el n�mero de d�as transcurrido desde que se realiz� hasta
--hoy.
--31. Obtener la fecha actual, en formato �(<nombre_d�a>) <d�a> de <nombre_mes> del a�o <a�o>�.
--Un ejemplo:
--(jueves) 7 de septiembre del a�o 2017
--32. Mostrar la informaci�n de todos los pedidos junto a la fecha en la que se realizaron, con el formato
--del ejercicio anterior.
--33. Obtener la hora actual con el formato �Las <hora> horas y <minutos> minutos�. Un ejemplo:
--Las 10 horas y 54 minutos

--Funciones de cadena
--34. �Cu�l es la longitud de tu nombre?
--35. Mostrar junto al nombre de cada empleado el n�mero de car�cteres que lo componen.
--36. Listar el nombre de los clientes anteponiendo la cadena �Don�.
--37. Mostrar el nombre de cada cliente sustituyendo la letra e por el s�mbolo @.
--38. Mostrar los primeros diez caracteres a la derecha de la frase: �Mi perro se llama Perico P�rez�.
--39. Para cada empleado mostrar su nombre, n�mero de empleado y su puesto de la forma: �Trabaja
--de ...� a�adiendo el puesto correspondiente. El nombre de la �ltima columna debe ser �Categor�a�.
--40. Igual que el ejercicio anterior pero cambiando el puesto de �Representante� por el de �Comercial�.
--41. Para cada producto obtener sus datos. Por no hacer muy largo el informe mostrar de la descripci�n
--solo los primeros 8 caracteres.

--Condicionales
--42. Mostrar los empleados cuya edad sea igual a 29 a�os;
--43. Listar toda la informaci�n de los pedidos de enero.
--44. Listar toda la informaci�n de los pedidos con un mes distinto a enero.
--45. Listar los n�meros de los empleados que tienen una oficina asignada.
--46. Listar los n�meros de los empleados que no tienen una oficina asignada y tienen m�s de 30 a�os.
--47. Listar los n�meros de las oficinas que no tienen director.
--48. Listar los datos de las oficinas de las regiones del norte y del este (tienen que aparecer primero las
--del norte y despu�s las del este).
--49. Mostrar la informaci�n de los empleados que trabajan en las oficinas 11, 12, 23 o 24.
--50. Listar los empleados cuyo nombre contengan una �r�.
--51. Mostrar los empleados cuyo apellido o segundo nombre comiencen por una �V�.
--52. Listar los productos cuyo idproducto acabe en �x�.

--Consultas multitablas
--53. Mostrar la informaci�n de los empleados junto a la informaci�n de las oficinas en las que trabajan.
--54. Igual que el ejercicio anterior, pero mostrando solo los empleados que trabajan en las oficinas del
--sur.
--55. Igual que el ejercicio anterior, ordenando los empleados por edad.
--56. Escribir una consulta que muestre la informaci�n de todos los empleados junto a los datos de su
--oficina.
--57. Escribir una consulta que muestre la informaci�n de todos los empleados (trabajen o no en una
--oficina) junto a la informaci�n de su oficina.
--58. Listar las oficinas del este indicando para cada una de ellas su n�mero, ciudad, n�meros y nombres de sus empleados. Hacer una versi�n en la que aparecen s�lo las que tienen empleados, y
--hacer otra en las que adem�s aparezcan las oficinas del este que no tienen empleados.
--59. Listar los pedidos mostrando su n�mero de pedido e importe, junto a la informaci�n del cliente
--(nombre y l�mite de cr�dito) que realiza el pedido.