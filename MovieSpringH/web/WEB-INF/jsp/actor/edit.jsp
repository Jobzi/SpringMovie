<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"   %>
<%@taglib  prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page  import="Model.DAO.DropDownDAO" %>
<%@page  import="Model.POJO.Sexo" %>
<%@page  import="java.util.Vector" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Editar Actor</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        
    </head>
      <% Vector Sexos = DropDownDAO.getViewDataSexo(); %>
    <body>
        <%@include file="../templateheader.jsp"%>
        <div class="hero common-hero">
            <div class="container">
                    <div class="row">
                            <div class="col-md-12">
                                    <div class="hero-ct">
                                            <h1>Pelicula</h1>
                                            <ul class="breadcumb">
                                                    <li class="active"><a href="/MovieSpringH/actor/index.htm">Actor</a></li>
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
                                    <form:form method="post" commandName="actor">          
                                        <p style="display:none;" name="ids">
                                             <form:input path="actId" cssClass="form-control"  />
                                              <form:select path="sexo.sexId" id="selectSid" items="<%= Sexos.get(0) %>" itemsLabel="Sexo"  cssClass="form-control" />
                                        </p>
                                        <form:errors path="*" element="div" cssClass="alert alert-danger" />	
						<h4>01. Actor detalles</h4>
						
						
						<div class="row">
							<div class="col-md-6 form-it">
								<form:label path="actNombre">Nombre:</form:label>
                                                                <form:input path="actNombre" cssClass="form-control" />
							</div>
							<div class="col-md-6 form-it">
								<form:label path="sexo.sexNombre">Nombre:</form:label>
                                                                <form:select path="sexo.sexNombre" id="selectSN" items="<%= Sexos.get(1) %>" itemsLabel="Sexo"  cssClass="form-control" />
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
   $("#selectSN" ) .change(function () {    
           $("#selectSid")[0].selectedIndex=$("#selectSN")[0].selectedIndex;
           
    });  
   
 </script>
  
</html>
