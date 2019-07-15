<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.List" %>
<%@page  import="java.util.Vector" %>
<%@page  import="Model.POJO.Formato" %>
<%@page  import="Model.DAO.FormatoDAO" %>
<%@page  import="Model.POJO.Genero" %>
<%@page  import="Model.DAO.GeneroDAO" %>
<%@page  import="Model.DAO.DropDownDAO" %>
<%@page  import="Model.POJO.Director" %>
<%@page  import="Model.DAO.DirectorDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Agregar Pelicula</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js">
            
        </script>
    </head>
        <% Vector Generos = DropDownDAO.getViewDataGenero();
       Vector Directores = DropDownDAO.getViewDataDirector();
       Vector Formatos = DropDownDAO.getViewDataFormato();
       %>

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
                                                    <li> <span class="ion-ios-arrow-right"></span> Agregar</li>
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
                                    <form:form method="post" commandName="pelicula">          
                                        <p style="display:none;" name="ids">
                                             <form:input path="pelId" cssClass="form-control"  />
                                             <form:select path="director.dirId" id="selectDid" items="<%= Directores.get(0) %>" itemsLabel="Director"  cssClass="form-control" />
                                             <form:select path="genero.genId" id="selectGid" items="<%= Generos.get(0) %>" itemsLabel="Generos"  cssClass="form-control" />
                                             <form:select path="formato.forId" id="selectFid" items="<%= Formatos.get(0) %>" itemsLabel="Formato"  cssClass="form-control" />
                                        </p>
                                        <form:errors path="*" element="div" cssClass="alert alert-danger" />	
						<h4>01. Pelicula detalles</h4>
						<div class="row">
							<div class="col-md-6 form-it">
								<form:label   path="pelNombre">Nombre:</form:label>
                                                                 <form:input type="text" path="pelNombre" cssClass="form-control" />
							</div>
							
						</div>
						
						<div class="row">
							<div class="col-md-6 form-it">
								 <form:label path="director.dirNombre">Director:</form:label>
                                                                 <form:select path="director.dirNombre" id="selectDN" items="<%= Directores.get(1) %>" itemsLabel="Director"  cssClass="form-control" />
							</div>
							<div class="col-md-6 form-it">
								 <form:label path="genero.genNombre">Genero:</form:label>
                                                                 <form:select path="genero.genNombre" id="selectGN" items="<%= Generos.get(1) %>" itemsLabel="Generos"  cssClass="form-control" />
							</div>
						</div>
                                                <div class="row">
                                                         <div class="col-md-6 form-it">
								 <form:label path="formato.forNombre">Formato:</form:label>
                                                                 <form:select  path="formato.forNombre" id="selectFN" items="<%= Formatos.get(1) %>" itemsLabel="Generos"  cssClass="form-control" />
							</div>
							<div class="col-md-6 form-it">
								 <form:label path="pelFechaEstreno" >Fecha Estreno: </form:label>
                                                                 <form:input  path="pelFechaEstreno" id="datepicker" cssClass="form-control" />
							</div>
							
						</div>
                                                <div class="row">
							<div class="col-md-6 form-it">
								 <form:label path="pelCosto">Costo</form:label>
                                                                  <form:input type="number" path="pelCosto" id="datepicker" cssClass="form-control" />
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
     <script>
   $( "#selectDN" ) .change(function () {    
           $("#selectDid")[0].selectedIndex=$("#selectDN")[0].selectedIndex;
           
    });  
     $( "#selectGN" ) .change(function () {    
           $("#selectGid")[0].selectedIndex=$("#selectGN")[0].selectedIndex;
           
    });  
     $( "#selectFN" ) .change(function () {    
           $("#selectFid")[0].selectedIndex=$("#selectFN")[0].selectedIndex;
           
    });  
 
        
    $(function () {
         $("#datepicker").datepicker();
        
    });
    
     
 </script> 
</html>
 