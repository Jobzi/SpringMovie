<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="java.util.Vector" %>
<%@page  import="Model.POJO.Socio" %>
<%@page  import="Model.POJO.Pelicula" %>
<%@page  import="Model.DAO.DropDownDAO" %>
<%@page  import="java.math.BigDecimal;" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Registrar Alquiler</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    </head>
    <% Vector Peliculas = DropDownDAO.getViewDataPeliculas();
            Vector Socios = DropDownDAO.getViewDataSocio();%>
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
                                    <form:form method="post" commandName="alquiler">          
                                        <p style="display:none;" name="ids">
                                            <form:input path="alqId" cssClass="form-control"  />
                                            <form:select path="socio.socId" id="selectSOid" items="<%= Socios.get(0)%>" itemsLabel="Generos"  cssClass="form-control" />
                                            <form:select path="pelicula.pelId" id="selectPid" items="<%= Peliculas.get(0)%>" itemsLabel="Director"  cssClass="form-control" />
                                            <form:select path="pelicula.pelCosto" id="selectPc" items="<%= Peliculas.get(2)%>" itemsLabel="Director"  cssClass="form-control" />
                                            
                                        </p>
                                        <form:errors path="*" element="div" cssClass="alert alert-danger" />	
						<h4>01. Alquiler detalles</h4>
						<div class="row">
							<div class="col-md-6 form-it">
								     <form:label path="socio.socNombre">Socio:</form:label>
                                                                     <form:select path="socio.socNombre" id="selectSON" items="<%= Socios.get(1)%>" itemsLabel="Director"  cssClass="form-control" />
							</div>
							<div class="col-md-6 form-it">
								    <form:label path="pelicula.pelNombre">Pelicula</form:label>
                                                                     <form:select path="pelicula.pelNombre" id="selectPN" items="<%= Peliculas.get(1)%>" itemsLabel="Generos"  cssClass="form-control" />
							</div>
							
						</div>
						
						
                                                <div class="row">
                                                         <div class="col-md-6 form-it">
								 <form:label path="alqFechaDesde" >Fecha Alquiler: </form:label>
                                                                 <form:input   path="alqFechaDesde" id="datepickerD" cssClass="form-control" />
							</div>
							<div class="col-md-6 form-it">
								<form:label path="alqFechaHasta" >Fecha Vencimiento: </form:label>
                                                                <form:input   path="alqFechaHasta" id="datepickerH" cssClass="form-control"   />    
							</div>
							
						</div>
                                                <div class="row">
							<div class="col-md-6 form-it" style="display:none;">
								 <form:label path="alqFechaEntrega" >Fecha Entrega: </form:label>
                                                                  <form:input path="alqFechaEntrega" id="datepickerE" cssClass="form-control" />
							</div>
							<div class="col-md-6 form-it">
								<form:label path="alqValor">Valor Alquiler</form:label>
                                                                <form:input id="alqval" path="alqValor"  cssClass="form-control" />
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

</html>
<script>
     
      $("#alqval").val($("#selectPc").val()); 
    $("#selectPN").change(function () {
        $("#selectPid")[0].selectedIndex = $("#selectPN")[0].selectedIndex;
        
        $("#selectPc")[0].selectedIndex = $("#selectPN")[0].selectedIndex;
            
        //var dt = new Date( $("#selectPc").val());
        $("#alqval").val($("#selectPc").val()); 
       

    });
    $("#selectSON").change(function () {
        $("#selectSOid")[0].selectedIndex = $("#selectSON")[0].selectedIndex;

    });


    $(function () {
        $("#datepickerD").datepicker();
        $("#datepickerH").datepicker();
        $("#datepickerE").datepicker();

    });
</script>  

   