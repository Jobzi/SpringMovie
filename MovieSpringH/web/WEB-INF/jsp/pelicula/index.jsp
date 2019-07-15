
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en" class="no-js">
<html>
    <head>
   
        <title>Pelicula</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    </head>
    <body>
        
         <%@include file="../templateheader.jsp"%>
        <div class="hero common-hero">
            <div class="container">
                    <div class="row">
                            <div class="col-md-12">
                                    <div class="hero-ct">
                                            <h1>Pelicula</h1>
                                            <ul class="breadcumb">
                                                    <li class="active"><a href="/MovieSpringH/pelicula/index.htm">Pelicula</a></li>
                                                    <li> <span class="ion-ios-arrow-right"></span> Movie Listing</li>
                                            </ul>
                                              <a href="<c:url value="/pelicula/add.htm" />" class="btn btn-success"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span> Agregar</a>
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
					<p>Found <span>${pelicula.size()}</span> in total</p>
					
                                </div>
				
				 <c:forEach items="${pelicula}" var="datos">
                                <div class="movie-item-style-2">
					<img src="../resources/images/uploads/mv-it1.jpg" alt="">
					<div class="mv-item-infor">
						<h6><a href="<c:url value="edit.htm?id=${datos.getPelId()}" />">${datos.getPelNombre()} <span>(${datos.getPelId()})</span></a></h6>
						<p class="rate"><i class="ion-android-star"></i><span>${datos.getPelCosto()}</span> $</p>
						<p class="describe">Es una Pelicula con grandes peresonajes una historia entrañable y creada por un gran director ganador de los premios Oscar</p>
                                                <p ><span>Fecha Estreno: ${datos.getPelFechaEstreno()}</span> - <span>Formato: ${datos.getFormato().getForNombre()}</span> </p>
						<p>Director: <a href="#">${datos.getDirector().getDirNombre()}</a></p>
						<p>Genero: <a href="#">${datos.getGenero().getGenNombre()}</a> </p>
						<p>Eliminar:  <a href="<c:url value="delete.htm?id=${datos.getPelId()}" />"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></a> </p>
                                                
					</div>
				</div>
                                     
                                 </c:forEach>
			</div>
                        <div class="col-md-3 col-xs-12 col-sm-12">
                            <div class="sidebar">
                                <div class="searh-form">
                                        <h4 class="sb-title">Search Pelicula</h4>
                                                <form class="form-style-1 celebrity-form" action="reportevalor.htm" method="POST">
                                                    <div class="row">
                                                        <div class="col-md-12 form-it">
                                                            <label>Valor</label>
                                                            <input type="number" step="any" name="valor" placeholder="Enter Value">
                                                        </div>

                                                        <div class="col-md-12 ">
                                                            <input class="submit" type="submit" value="sent">
                                                        </div>
                                                    </div>
                                                </form>
                                </div>
                                
                                <div class="searh-form">
                                        <h4 class="sb-title">Download Pdf</h4>
                                            <div class="col-md-12 ">
                                                <a href="/MovieSpringH/file/download.htm?tag=pelicula">
                                                    <input class="redbtn" type="button" value="download pdf">
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
