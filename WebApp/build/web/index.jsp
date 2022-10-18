<%-- 
    Document   : index
    Created on : 10-17-2022, 03:36:29 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Biblioteca</title>
        <script>
            function actualizar(id, last)
            {
                var nlast = prompt("Ingrese el apellido que reemplaza el actual apellido(" + last + ")");
                location.href = "actualizar.jsp?id=" + id + "&last=" + last + "&nlast=" + nlast;
            }
            function eliminar(id)
            {
                alert("A continuación se eliminará el registro #"+id);
                location.href = "delete.jsp?id=" + id;
            }
        </script>
    </head>
    <body style = "font-family: sans-serif">
        <h1 style = "text-align: center">Bienvenido/a a la biblioteca</h1>
        <sql:query dataSource = "${fuenteDatos}" var = "result">
            SELECT * from libro;
        </sql:query>
        
            
        <h2>Listado de libros disponibles</h2>
        <table border = "1" width = "100%">
            <tr>
                <th>ID libro</th>
                <th>ISBN</th>
                <th>Título</th>
                <th>Autor</th>
                <th>Editorial</th>
                <th>Opciones</th>
            </tr>

            <c:forEach var = "row" items = "${result.rows}">
                <tr>
                    <td style="text-align: center">
                        <c:out value = "${row.id}"/>
                    </td>
                    <td style="text-align: center"><c:out value = "${row.isbn}"/></td>
                    <td><c:out value = "${row.titulo}"/></td>
                    <td><c:out value = "${row.autor}"/></td>
                    <td onclick="actualizar('${row.id}', '${row.last}');">  
                        <c:out value = "${row.editorial}"/>
                    </td>
                    <td style = "text-align: center">
                        <a href="#" onmouseover="this.style.backgroundColor='pink';"
                           onmouseout="this.style.backgroundColor='white';"
                           onclick="eliminar('${row.id}');">Eliminar</a><br>
                           
                        <a href="#" onmouseover="this.style.backgroundColor='yellow';"
                           onmouseout="this.style.backgroundColor='white';">Actualizar</a>
                    </td>
                    
                </tr>
            </c:forEach>
        </table>
    </body>
</html>
