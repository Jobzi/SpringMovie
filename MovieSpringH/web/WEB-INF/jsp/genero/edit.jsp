<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Edit Genero</title>
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
                                                    <li class="active"><a href="/MovieSpringH/genero/index.htm">Genero</a></li>
                                                    <li> <span class="ion-ios-arrow-right"></span> Editar</li>
                                            </ul>
                                            
                                    </div>
                            </div>
                    </div>
            </div>
        </div>
        <div class="page-single">
	<div class="container">
		<div class="row ipad-width">
			
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="form-style-1 user-pro" action="#">
                                    <form:form method="post" commandName="genero">          
                                        <p style="display:none;" name="ids">
                                            <form:label path="genId">ID</form:label>
                                            <form:input path="genId" cssClass="form-control" hidden="false"/>
                                        </p>
                                        <form:errors path="*" element="div" cssClass="alert alert-danger" />	
						<h4>01. Genero detalles</h4>
						
						
						<div class="row">
							<div class="col-md-6 form-it">
                                                            <form:label path="genNombre">Nombre:</form:label>
                                                                <form:input path="genNombre" cssClass="form-control" />
							</div>
							
						</div>
                                                <div class="row">
                                                          <div class="col-md-2">
                                                                  <input class="submit" type="submit" value="save">
                                                          </div>
                                                </div>	
                                         </form:form>
					
                                            </div>
                                    </div>
                            </div>
                    </div>
            </div>
         <div class="col-md-8 col-sm-12 col-xs-12">
			
        </div>
         <%@include file="../templatefoot.jsp"%>
    </body>
    <script src="<c:url value="/resources/js/jquery.js"/>"></script>
    <script src="<c:url value="/resources/js/plugins.js"/>"></script>
    <script src="<c:url value="/resources/js/plugins2.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
</html>
