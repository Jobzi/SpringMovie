<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>Admin Manager</title>
        <script src="https://www.chartjs.org/dist/2.8.0/Chart.min.js"></script>
	<script src="https://www.chartjs.org/samples/latest/utils.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
    </head>
   
    <body>
         <%@include file="../templateheader.jsp"%>
           <div class="hero common-hero">
            <div class="container">
                    <div class="row">
                            <div class="col-md-12">
                                    <div class="hero-ct">
                                            <h1>Admin Manager</h1>
                                            <ul class="breadcumb">
                                                    <li class="active"><a href="/MovieSpringH/manager/index.htm">Manager</a></li>
                                                    <li> <span class="ion-ios-arrow-right"></span> Administrar</li>
                                            </ul>
                                            
                                    </div>
                            </div>
                    </div>
            </div>
        </div>
        <div class="page-single">
	<div class="container">
		<div class="row ipad-width">
			<div class="col-md-3 col-sm-12 col-xs-12">
				<div class="user-information">
					<div class="user-img">
						<a href="#"><img src="/MovieSpringH/resources/images/uploads/user-img.png" alt=""><br></a>
						<a href="/MovieSpringH/alquiler/add.htm" class="redbtn">Rentar</a>
					</div>
					<div class="user-fav">
						<p>Accesos Rapidos</p>
						<ul>
							<li  class="active"><a href="/MovieSpringH/pelicula/add.htm">Agregar Pelicula</a></li>
							<li><a href="/MovieSpringH/actor/add.htm">Agregar Actor</a></li>
							<li><a href="/MovieSpringH/genero/add.htm">Agregar Genero Pelicula</a></li>
						</ul>
					</div>
					
				</div>
			</div>
			<div class="col-md-9 col-sm-12 col-xs-12">
				<div class="form-style-1 user-pro" action="#">
					
                                    <div id="canvas-holder" style="width:100%">
                                            <canvas id="chart-area"></canvas>
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
        <script>
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};

		var config = {
			type: 'doughnut',
			data: {
				datasets: [{
					data: [
						50,
						40,
						50,
						50,
						46,
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
					],
					label: 'Dataset 1'
				}],
				labels: [
					'BATMAN INICIA',
					'SPIDERMAN',
					'US',
					'FINAL DESTINY',
					'XXX'
				]
			},
			options: {
				responsive: true,
				legend: {
					position: 'top',
				},
				title: {
					display: true,
					text: 'INFO PELICULAS'
				},
				animation: {
					animateScale: true,
					animateRotate: true
				}
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myDoughnut = new Chart(ctx, config);
		};

		
		
	</script>
</html>
