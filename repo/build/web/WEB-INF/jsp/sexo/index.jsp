<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Sexo</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        <%@include file="../header-form.jsp"%>
        <%@include file="../bg-form.jsp"%>
        <div class="container">
            <div class="row">
                <h1>Sexo</h1>
                <p>
                    <a href="<c:url value="/sexo/add.htm" />" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
                </p>
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Sexo</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sexo}" var="datos">
                            <tr>
                                <td><c:out value="${datos.getSexId()}" /></td>
                                <td><c:out value="${datos.getSexNombre()}" /></td>
                                <td>
                                    <a href="<c:url value="edit.htm?id=${datos.getSexId()}" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a href="<c:url value="delete.htm?id=${datos.getSexId()}" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
        </div>
    </body>
</html>
