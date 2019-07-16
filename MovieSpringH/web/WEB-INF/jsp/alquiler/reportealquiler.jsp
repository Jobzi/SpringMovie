<%-- 
    Document   : reportealquiler
    Created on : Jul 16, 2019, 12:42:30 PM
    Author     : benja
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Pelicula</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        <div class="container">
            <div class="row">
                <h1>Reporte Alquiler</h1>
                <p>
                    <form action="reportealquiler.htm" method="POST">
                    valor: <input type="text" step="any" name="valor"/>
                    <input type="submit" value="calcular"/>
                    </form>

                </p>
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Genero</th>
                            <th>Director</th>
                            <th>Formato</th>
                            <th>Fecha Estreno</th>
                            <th>Costo</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${pelicula}" var="datos">
                            <tr>    
                                <td><c:out value="${datos.getPelNombre()}" /></td>
                                <td><c:out value="${datos.getGenero().getGenNombre()}" /></td>
                                <td><c:out value="${datos.getFormato().getForNombre()}" /></td>
                                <td><c:out value="${datos.getDirector().getDirNombre()}" /></td>
                                <td><c:out value="${datos.getPelFechaEstreno()}" /></td>
                                <td><c:out value="${datos.getPelCosto()}" /></td> 
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
        </div>
    </body>
</html>
