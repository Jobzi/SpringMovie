<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page  import="Model.DAO.DropDownDAO" %>
<%@page  import="Model.POJO.Actor" %>
<%@page  import="Model.POJO.Pelicula" %>
<%@page  import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Editar Actor Pelicula</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
    </head>
      <% Vector Actores = DropDownDAO.getViewDataActor();
          Vector Peliculas = DropDownDAO.getViewDataPelicula();
      %>
   <body>
        <%@include file="../templateheader.jsp"%>
        <div class="hero common-hero">
            <div class="container">
                    <div class="row">
                            <div class="col-md-12">
                                    <div class="hero-ct">
                                            <h1>Actor Pelicula</h1>
                                            <ul class="breadcumb">
                                                    <li class="active"><a href="/MovieSpringH/actorpelicula/index.htm">Actor Pelicula</a></li>
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
                                    <form:form method="post" commandName="actor_pelicula">          
                                        <p style="display:none;" name="ids">
                                              <form:input path="aplId" cssClass="form-control" />
                                              <form:select path="actor.actId" id="selectAid" items="<%= Actores.get(0) %>" itemsLabel="actores"  cssClass="form-control" />
                                              <form:select path="pelicula.pelId" id="selectPid" items="<%= Peliculas.get(0) %>" itemsLabel="peliculas"  cssClass="form-control" />
                                        </p>
                                        <form:errors path="*" element="div" cssClass="alert alert-danger" />	
						<h4>01. Actor Pelicula detalles</h4>
						
						
						<div class="row">
							<div class="col-md-6 form-it">
                                                            <form:label path="aplPapel">Papel:</form:label>
                                                            <form:input path="aplPapel" cssClass="form-control" />
							</div>
							<div class="col-md-6 form-it">
                                                             <form:label path="actor.actNombre">Actor</form:label>
                                                             <form:select path="actor.actNombre" id="selectAN" items="<%= Actores.get(1) %>" itemsLabel="peliculas"  cssClass="form-control" />
							</div>
						</div>
						<div class="row">
							
							<div class="col-md-6 form-it">
                                                            <form:label path="pelicula.pelNombre">Pelicula:</form:label>
                                                            <form:select path="pelicula.pelNombre" id="selectPN" items="<%= Peliculas.get(1) %>" itemsLabel="peliculas"  cssClass="form-control" />
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
        
    <script>
   $("#selectAN" ) .change(function () {    
           $("#selectAid")[0].selectedIndex=$("#selectAN")[0].selectedIndex;
           
    });  
   $("#selectPN" ) .change(function () {    
           $("#selectPid")[0].selectedIndex=$("#selectPN")[0].selectedIndex;
           
    });    
   
 </script>  
</html>
