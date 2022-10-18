<%-- 
    Document   : delete
    Created on : 10-17-2022, 05:48:15 PM
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@ include file="fuentedatos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Eliminando libro</title>
        <style>
            .fila${param.id} {background-color:red;color:pink;}
        </style>
    </head>
    <body style = "font-family: sans-serif">
        <h1 style = "text-align: center">Procesando la eliminación de libro</h1>
        <p style="display: block; margin-right: 80px">En hora buena, su solicitud se completo correctamente. A continuación, se muestra los resultados:</p>
        
        <c:set var = "empId" value = "${param.id}"/>
        
        <sql:update dataSource = "${fuenteDatos}" var = "count">
            DELETE FROM libro WHERE Id = ?
            <sql:param value = "${empId}" />
        </sql:update>
        
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
                    
                </tr>
            </c:forEach>
        </table>
        <br>
        <br>
        <a href="index.jsp" 
           style="
           display: block;
           color: white;
           background-color: burlywood;
           border-radius: 5px;
           font-weight: bold;
           margin-left: 10px;
           width:18%;
           padding: 0.5em;
           text-align: center;">
            REGRESANDO A INICIO</a>
    </body>
</html>
