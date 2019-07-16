<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Socio</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
       
        <%@include file="../templateheader.jsp"%>
       <div class="hero common-hero">
            <div class="container">
                    <div class="row">
                            <div class="col-md-12">
                                    <div class="hero-ct">
                                            <h1>Socio</h1>
                                            <ul class="breadcumb">
                                                    <li class="active"><a href="/MovieSpringH/actor/index.htm">Socio</a></li>
                                                    <li> <span class="ion-ios-arrow-right"></span> Listado Socio</li>
                                            </ul>
                                               <a href="<c:url value="/socio/add.htm" />" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
                                            
                                    </div>
                            </div>
                    </div>
            </div>
        </div>
    <% String []img ={"",""}; %>
  <div class="page-single movie_list">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="topbar-filter">
					<p class="pad-change">Socios <span>${socio.size()} </span> encontrados</p>
					
				</div>      
                              <c:forEach items="${socio}" var="datos">
                            
                                                            
                                <div class="row">
					<div class="col-md-12">
						<div class="ceb-item-style-2">
							<img src="../resources/images/uploads/ceblist1.jpg" alt="">
							<div class="ceb-infor">
								<h2><a href="edit.htm?id=${datos.getSocId()}">${datos.getSocNombre()}</a></h2>
								<span>${datos.getSocId()}</span>
								<span>Cedula: ${datos.getSocNombre()}</span>
                                                                <span>Cedula: ${datos.getSocCedula()}</span>
                                                                <span>Direccion: ${datos.getSocDireccion()}</span>
                                                                <span>Telefono: ${datos.getSocTelefono()}</span>
                                                                <span>Correo: ${datos.getSocCorreo()}</span>
								<p> Los Usuarios Block Buster Son Usuarios con una gran pasion por el contenido de calidad</p>
                                                                
                                                        </div>
                                                               
						</div>
                                                  <a href="<c:url value="delete.htm?id=${datos.getSocId()}" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
					</div>
                                        <br>
					
				</div>
                            
                        </c:forEach>
				
				
			</div>
			<div class="col-md-3 col-xs-12 col-sm-12">
				<div class="sidebar">
						<div class="searh-form">
						<h4 class="sb-title">Buscar Socio</h4>
						<form class="form-style-1 celebrity-form" action="reportesocio.htm" method="POST">
							<div class="row">
								<div class="col-md-12 form-it">
									<label>Ingrese la Cedula del Socio</label>
									<input type="text" step="any" name="valor"/>
								</div>
								
								<div class="col-md-12 ">
									<input class="submit" type="submit" value="Buscar">
								</div>
							</div>
						</form>
					</div>
                                                <div class="searh-form">
                                        <h4 class="sb-title">Descargar Pdf</h4>
                                            <div class="col-md-12 ">
                                                <a href="/MovieSpringH/file/download.htm?tag=socio">
                                                    <input class="redbtn" type="button" value="descargar pdf">
                                                </a>
                                                  
                                            </div>
                                </div>
					
				</div>
			</div>
		</div>
	</div>
</div>
            <%@include file="../templatefoot.jsp"%>
  </body>
        <script src="<c:url value="/resources/js/jquery.js"/>"></script>
        <script src="<c:url value="/resources/js/plugins.js"/>"></script>
        <script src="<c:url value="/resources/js/plugins2.js"/>"></script>
        <script src="<c:url value="/resources/js/custom.js"/>"></script>
</html>
