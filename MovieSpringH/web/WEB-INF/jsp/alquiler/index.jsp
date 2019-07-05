
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<html>
    <head>
   
        <title>Alquiler</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        
         <%@include file="../templateheader.jsp"%>
        <div class="hero common-hero">
            <div class="container">
                    <div class="row">
                            <div class="col-md-12">
                                    <div class="hero-ct">
                                            <h1>Alquiler</h1>
                                            <ul class="breadcumb">
                                                    <li class="active"><a href="/MovieSpringH/alquiler/index.htm">Alquiler</a></li>
                                                    <li> <span class="ion-ios-arrow-right"></span> Alquiler Listing</li>
                                            </ul>
                                              <a href="<c:url value="/alquiler/add.htm" />" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
                                    </div>
                            </div>
                    </div>
            </div>
        </div>
        <% String []img ={"",""}; %>
      <div class="page-single movie_list">
	<div class="container">
		<div class="row ipad-width2">
		
			<div class="col-md-8 col-sm-12 col-xs-12">
				<div class="topbar-filter">
					<p>Found <span>${alquiler.size()}</span> in total</p>
					
                                </div>
				
				 <c:forEach items="${alquiler}" var="datos">
                                <div class="movie-item-style-2">
					<img src="../resources/images/uploads/mv-it1.jpg" alt="">
					<div class="mv-item-infor">
						<h6><a href="<c:url value="edit.htm?id=${datos.getAlqId()}" />">${datos.getPelicula().getPelNombre()} <span>(${datos.getPelicula().getPelId()})</span></a></h6>
						<p class="rate"><i class="ion-android-star"></i><span>${datos.getAlqValor()}</span> $</p>
						<p>Socio: <a href="/MovieSpringH/socio/edit.htm?id=${datos.getSocio().getSocId()}"> ${datos.getSocio().getSocNombre()}</a> </p>
						<p class="describe">Es una Pelicula con grandes peresonajes una historia entra�able y creada por un gran director ganador de los premios Oscar</p>
                                                <p ><span>Fecha Alquiler: ${datos.getAlqFechaDesde()}</span> - <span>Fecha Vencimiento: ${datos.getAlqFechaHasta()}</span> </p>
						<p>Fecha Entrega <a href="#">${datos.getAlqFechaEntrega()}</a></p>
						<p>Eliminar:  <a href="<c:url value="delete.htm?id=${datos.getAlqId()}" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a> </p>
                                                
					</div>
				</div>
                                     ]
                                 </c:forEach>
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
