

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!--Google Font-->
<link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
<!-- Mobile specific meta -->
<meta name=viewport content="width=device-width, initial-scale=1">
<meta name="format-detection" content="telephone-no">
<link rel="stylesheet" href="<c:url value="/resources/css/plugins.css"/>"/>
<link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/> 

    <!-- BEGIN | Header -->
    <header class="ht-header">
        <div class="container">
            <nav class="navbar navbar-default navbar-custom">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header logo">
                    <div class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <div id="nav-icon1">
                            <span></span>
                            <span></span>
                            <span></span>
                        </div>
                    </div>
                    <a href="#"><img class="logo" src="resources/images/logo1.png" alt="" width="119" height="58"></a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse flex-parent" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav flex-child-menu menu-left">
                        <li class="hidden">
                            <a href="#page-top"></a>
                        </li>
                    </ul>
                    <ul class="nav navbar-nav flex-child-menu menu-right">

                        <li class="loginLink"><a href="#">Iniciar Sesion</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </nav>

        </div>
    </header>
    <script src="<c:url value="/resources/js/jquery.js"/>"></script>
    <script src="<c:url value="/resources/js/plugins.js"/>"></script>
    <script src="<c:url value="/resources/js/plugins2.js"/>"></script>
    <script src="<c:url value="/resources/js/custom.js"/>"></script>
    <!-- END | Header -->
