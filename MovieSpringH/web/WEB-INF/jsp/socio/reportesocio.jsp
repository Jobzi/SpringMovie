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
                <h1>Pelicula</h1>
                    <form action="reportesocio.htm" method="POST">
                    valor: <input type="text" step="any" name="valor"/>
                    <input type="submit" value="calcular"/>
                    </form> 
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Cedula</th>
                            <th>Nombre</th>
                            <th>Direccion</th>
                            <th>Telefono</th>
                            <th>Correo</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${socio}" var="datos">
                            <tr>
                                <td><c:out value="${datos.getSocId()}" /></td>
                                <td><c:out value="${datos.getSocCedula()}" /></td>
                                <td><c:out value="${datos.getSocNombre()}" /></td>
                                <td><c:out value="${datos.getSocDireccion()}" /></td>
                                <td><c:out value="${datos.getSocTelefono()}" /></td>
                                <td><c:out value="${datos.getSocCorreo()}" /></td>
                                <td>
                                    <a href="<c:url value="edit.htm?id=${datos.getSocId()}" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a href="<c:url value="delete.htm?id=${datos.getSocId()}" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                
                
            </div>
            
        </div>
    </body>
</html>