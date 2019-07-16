<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Director</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
       
        <%@include file="../templateheader.jsp"%>
       <div class="hero common-hero">
            <div class="container">
                    <div class="row">
                            <div class="col-md-12">
                                    <div class="hero-ct">
                                            <h1>Director</h1>
                                            <ul class="breadcumb">
                                                    <li class="active"><a href="/MovieSpringH/director/index.htm">Director</a></li>
                                                    <li> <span class="ion-ios-arrow-right"></span> Listado Director</li>
                                            </ul>
                                               <a href="<c:url value="/director/add.htm" />" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
                                            
                                    </div>
                            </div>
                    </div>
            </div>
        </div>
       <div class="page-single">
	<div class="container">
		<div class="row ipad-width2">
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="topbar-filter">
					<p class="pad-change">Director<span>${director.size()} </span>encontrado</p>
					
				</div>
                              <c:forEach items="${director}" var="datos">
                            
                                    
                               
                                <div class="row">
					<div class="col-md-12">
						<div class="ceb-item-style-2">
							<img src="../resources/images/uploads/ceblist1.jpg" alt="">
							<div class="ceb-infor">
								<h2><a href="edit.htm?id=${datos.getDirId()}">${datos.getDirNombre()}</a></h2>
								<span>${datos.getDirId()}</span>
								<p>Dan Stevens was born at Croydon in Surrey on 10th October 1982. His parents are teachers. He was educated at Tonbridge School and trained in acting at the National Youth Theatre of Great Britain... </p>
                                                            
                                                        </div>
                                                               
						</div>
                                                  <a href="<c:url value="delete.htm?id=${datos.getDirId()}" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a>
					</div>
                                        <br>
					
				</div>
                            
                        </c:forEach>
				
				
			</div>
			<div class="col-md-3 col-xs-12 col-sm-12">
				<div class="sidebar">
						<div class="searh-form">
						<h4 class="sb-title">Buscar Director</h4>
						<form class="form-style-1 celebrity-form" action="reportedirector.htm" method="POST">
							<div class="row">
								<div class="col-md-12 form-it">
									<label>Nombre del director</label>
									<input type="text" name="valor" placeholder="Enter keywords">
								</div>
								
								<div class="col-md-12 ">
									<input class="submit" type="submit" value="buscar">
								</div>
							</div>
						</form>
					</div>
                                                <div class="searh-form">
                                                        <h4 class="sb-title">Descargar Pdf</h4>
                                                            <div class="col-md-12 ">
                                                                <a href="/MovieSpringH/file/download.htm?tag=director">
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
