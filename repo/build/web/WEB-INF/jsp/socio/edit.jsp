<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Editar</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        <div class="container">
            <ol class="breadcrumb">
                <li><a href="<c:url value="socio/home.htm" />">Listado de Socios</a></li>
                <li class="active">Editar</li>
            </ol>
            <div class="panel panel-primary">
                <div class="panel-heading">Editar</div>
                <div class="panel-body">
                   
                        <form:form method="post" commandName="socio">
                            <h1>Complete el formulario</h1>
                            
                            <form:errors path="*" element="div" cssClass="alert alert-danger" />
                            
                            <p>
                                <form:label path="socCedula">Cedula:</form:label>
                                <form:input path="socCedula" cssClass="form-control" />
                                
                            </p>
                            <p>
                                <form:label path="socNombre">Nombre:</form:label>
                                <form:input path="socNombre" cssClass="form-control" />
                                
                            </p>
                            <p>
                                <form:label path="socDireccion">Direccion:</form:label>
                                <form:input path="socDireccion" cssClass="form-control" />
                                
                            </p>
                            <p>
                                <form:label path="socTelefono">Teléfono:</form:label>
                                <form:input path="socTelefono" cssClass="form-control" />
                            </p>
                            <p>
                                <form:label path="socCorreo">Correo electrónico:</form:label>
                                <form:input path="socCorreo" cssClass="form-control" />
                            </p>
                            <hr />
                            <input type="submit" value="Enviar" class="btn btn-danger" />
                        </form:form>
                </div>
            </div>
        </div>
    </body>
</html>
