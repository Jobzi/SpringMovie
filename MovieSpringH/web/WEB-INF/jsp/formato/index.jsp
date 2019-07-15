<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Formato</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
                <%@include file="../templateheader.jsp"%>
         <div class="hero common-hero">
            <div class="container">
                    <div class="row">
                            <div class="col-md-12">
                                    <div class="hero-ct">
                                            <h1>Formato</h1>
                                            <ul class="breadcumb">
                                                    <li class="active"><a href="/MovieSpringH/formato/index.htm">Formato</a></li>
                                                    <li> <span class="ion-ios-arrow-right"></span> Listado Formato</li>
                                            </ul>
                                            
                                    </div>
                            </div>
                    </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <h1>Formato</h1>
                <p>
                    <a href="<c:url value="/formato/add.htm" />" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
                </p>
                <table class="table table-bordered table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Formato</th>
                            <th>Opciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${formato}" var="datos">
                            <tr>
                                <td><c:out value="${datos.getForId()}" /></td>
                                <td><c:out value="${datos.getForNombre()}" /></td>
                                <td>
                                    <a href="<c:url value="edit.htm?id=${datos.getForId()}" />"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span></a>
                                    <a href="<c:url value="delete.htm?id=${datos.getForId()}" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
            
        </div>
                  <%@include file="../templatefoot.jsp"%>
        <script src="<c:url value="/resources/js/jquery.js"/>"></script>
        <script src="<c:url value="/resources/js/plugins.js"/>"></script>
        <script src="<c:url value="/resources/js/plugins2.js"/>"></script>
        <script src="<c:url value="/resources/js/custom.js"/>"></script>
    </body>
</html>
