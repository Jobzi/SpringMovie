
<!DOCTYPE html>
<!--[if IE 7]>
<html class="ie ie7 no-js" lang="en-US">
<![endif]-->
<!--[if IE 8]>
<html class="ie ie8 no-js" lang="en-US">
<![endif]-->
<!--[if !(IE 7) | !(IE 8)  ]><!-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="java.util.List"%>
<%@page  import="java.util.Vector" %>
<%@page  import="java.math.BigDecimal" %>
<%@page  import="Model.POJO.Pelicula" %>
<%@page  import="Model.DAO.PeliculaDAO" %>
<%@page  import="Model.POJO.Actor" %>
<%@page  import="Model.DAO.DropDownDAO" %>
<html lang="en" class="no-js">

    <head>
        <!-- Basic need -->
        <title>Movie Spring App</title>
        <meta charset="UTF-8">
        <meta name="description" content="">
        <meta name="keywords" content="">
        <meta name="author" content="">
        <link rel="profile" href="#">

        <!--Google Font-->
        <link rel="stylesheet" href='http://fonts.googleapis.com/css?family=Dosis:400,700,500|Nunito:300,400,600' />
        <!-- Mobile specific meta -->
        <meta name=viewport content="width=device-width, initial-scale=1">
        <meta name="format-detection" content="telephone-no">

        <link rel="stylesheet" href="<c:url value="/resources/css/plugins.css"/>"/>
        <link rel="stylesheet" href="<c:url value="/resources/css/style.css"/>"/>   



    </head>
    <% List<Pelicula> Peliculas = PeliculaDAO.getlist();
       Vector Actores = DropDownDAO.getViewDataActor();
       %>
    <body>
        <!--preloading-->
        <div id="preloader">
            <img class="logo" src="resources/images/logo1.png" alt="" width="119" height="58">
            <div id="status">
                <span></span>
                <span></span>
            </div>
        </div>
        <!--end of preloading-->
        <!--login form popup-->
        <div class="login-wrapper" id="login-content">
            <div class="login-content">
                <a href="#" class="close">x</a>
                <h3>Iniciar Sesion</h3>
                <form method="post" action="#">
                    <div class="row">
                        <label for="username">
                            Nombre de Usuario:
                            <input type="text" name="username" id="username" placeholder="User" pattern="^[a-zA-Z][a-zA-Z0-9-_\.]{8,20}$" required="required" />
                        </label>
                    </div>

                    <div class="row">
                        <label for="password">
                            Contraseña:
                            <input type="password" name="password" id="password" placeholder="******" pattern="(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$" required="required" />
                        </label>
                    </div>
                    <div class="row">
                        <div class="remember">
                            <div>
                                <input type="checkbox" name="remember" value="Remember me"><span>Recuerdame</span>
                            </div>
                            <a href="#">Olvide mi contraseña..</a>
                        </div>
                    </div>
                    <div class="row">
                        <button type="submit" > <a href="/MovieSpringH/resources/landing.html">Iniciar Sesion</a></button>
                    </div>
                </form>
                <div class="row">
                    <p>O via red social</p>
                    <div class="social-btn-2">
                        <a class="fb" href="#"><i class="ion-social-facebook"></i>Facebook</a>
                        <a class="tw" href="#"><i class="ion-social-twitter"></i>twitter</a>
                    </div>
                </div>
            </div>
        </div>
        <!--end of login form popup-->



        <%@include file="header.jsp"%>          


        <div class="slider movie-items">
            <div class="container">
                <div class="row">
                    <div class="social-link">
                        <p>Follow us: </p>
                        <a href="#"><i class="ion-social-facebook"></i></a>
                        <a href="#"><i class="ion-social-twitter"></i></a>
                        <a href="#"><i class="ion-social-googleplus"></i></a>
                        <a href="#"><i class="ion-social-youtube"></i></a>
                    </div>
                    <div  class="slick-multiItemSlider">
                       
                         <c:forEach items="<%= Peliculas%>" var="datos">
                           
                            <div class="movie-item">
                                <div class="mv-img">
                                    <a href="#"><img src="resources/images/uploads/slider1.jpg" alt="" width="285" height="437"></a>
                                </div>
                                <div class="title-in">
                                   <span class="green"><a href="#">${datos.getGenero().getGenNombre()}</a></span>
                                    <h6><a href="#">${datos.getPelNombre()}</a></h6>
                                   <p><i class="ion-android-star"></i><span>${datos.getPelCosto()}</span> /10</p>
                                    
                                </div>
                            </div>
                        </c:forEach>
                        
                        
   
                    </div>
                </div>
            </div>
        </div>
        <div class="movie-items">
            <div class="container">
                <div class="row ipad-width">
                    <div class="col-md-8">
                        <div class="title-hd">
                            <h2>Disponible</h2>
                            <a href="#" class="viewall"> Ver todo <i class="ion-ios-arrow-right"></i></a>
                        </div>
                        <div class="tabs">
                            <ul class="tab-links">
                                <li class="active"><a href="#tab1">#Popular</a></li>
                                <li><a href="#tab2"> #Proximamente</a></li>
                            </ul>
                            <div class="tab-content">
                                <div id="tab1" class="tab active">
                                    <div class="row">
                                        <div class="slick-multiItem">
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item1.jpg" alt="" width="185" height="284">
                                                    </div> 
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6 class="loginLink"><a href="#">Interstellar</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item2.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The revenant</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item3.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item4.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The walk</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item5.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Interstellar</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item6.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The revenant</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item7.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item8.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The walk</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item3.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab2" class="tab">
                                    <div class="row">
                                        <div class="slick-multiItem">
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item5.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Interstellar</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item6.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The revenant</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item7.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="images/uploads/mv-item8.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The walk</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="images/uploads/mv-item3.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="title-hd">
                            <h2>En Cartelera</h2>
                            <a href="#" class="viewall"> Ver todo <i class="ion-ios-arrow-right"></i></a>
                        </div>
                        <div class="tabs">
                            <div class="tab-content">
                                <div id="tab1" class="tab active">
                                    <div class="row">
                                        <div class="slick-multiItem">
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item1.jpg" alt="" width="185" height="284">
                                                    </div> 
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6 class="loginLink"><a href="#">Interstellar</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item2.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The revenant</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item3.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item4.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The walk</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item5.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Interstellar</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item6.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The revenant</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item7.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item8.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The walk</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item3.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="tab2" class="tab">
                                    <div class="row">
                                        <div class="slick-multiItem">
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item5.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Interstellar</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item6.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The revenant</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item7.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item8.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">The walk</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="slide-it">
                                                <div class="movie-item">
                                                    <div class="mv-img">
                                                        <img src="resources/images/uploads/mv-item3.jpg" alt="" width="185" height="284">
                                                    </div>
                                                    <div class="hvr-inner">
                                                        <a  href="#" class="loginLink"> Reservar <i class="ion-android-arrow-dropright"></i> </a>
                                                    </div>
                                                    <div class="title-in">
                                                        <h6><a href="#">Die hard</a></h6>
                                                        <p><i class="ion-android-star"></i><span>7.4</span> /10</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="sidebar">
                            <div class="ads">
                                <img src="resources/images/uploads/ads1.png" alt="" width="336" height="296">
                            </div>
                            <div class="celebrities">
                                <h4 class="sb-title">Actores</h4>
                                 <c:forEach items="<%= Actores.get(1)%>" var="datos">
                                     <div class="celeb-item">
                                        <a href="#"><img src="resources/images/uploads/ava1.jpg" alt="" width="70" height="70"></a>
                                        <div class="celeb-author">
                                            <h6><a href="#">${datos}</a></h6>
                                            <span>Actor</span>
                                        </div>
                                    </div>
                           
                                 </c:forEach>
                                

                                <a href="/MovieSpring/actor/index.htm" class="btn">Ver todos los Actores<i class="ion-ios-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="trailers">
            <div class="container">
                <div class="row ipad-width">
                    <div class="col-md-12">
                        <div class="title-hd">
                            <h2>Disponible</h2>
                            <a href="#" class="viewall">Ver Todo <i class="ion-ios-arrow-right"></i></a>
                        </div>
                        <div class="videos">
                            <div class="slider-for-2 video-ft">
                                <div>
                                    <iframe class="item-video" src="#" data-src="https://www.youtube.com/embed/1Q8fG0TtVAY"></iframe>
                                </div>
                                <div>
                                    <iframe class="item-video" src="#" data-src="https://www.youtube.com/embed/w0qQkSuWOS8"></iframe>
                                </div>
                                <div>
                                    <iframe class="item-video" src="#" data-src="https://www.youtube.com/embed/44LdLqgOpjo"></iframe>
                                </div>
                                <div>
                                    <iframe class="item-video" src="#" data-src="https://www.youtube.com/embed/gbug3zTm3Ws"></iframe>
                                </div>
                                <div>
                                    <iframe class="item-video" src="#" data-src="https://www.youtube.com/embed/e3Nl_TCQXuw"></iframe>
                                </div>
                                <div>
                                    <iframe class="item-video" src="#" data-src="https://www.youtube.com/embed/NxhEZG0k9_w"></iframe>
                                </div>


                            </div>
                            <div class="slider-nav-2 thumb-ft">
                                <div class="item">
                                    <div class="trailer-img">
                                        <img src="resources/images/uploads/trailer7.jpg"  alt="photo by Barn Images" width="4096" height="2737">
                                    </div>
                                    <div class="trailer-infor">
                                        <h4 class="desc">Wonder Woman</h4>
                                        <p>2:30</p>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="trailer-img">
                                        <img src="resources/images/uploads/trailer2.jpg"  alt="photo by Barn Images" width="350" height="200">
                                    </div>
                                    <div class="trailer-infor">
                                        <h4 class="desc">Oblivion: Official Teaser Trailer</h4>
                                        <p>2:37</p>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="trailer-img">
                                        <img src="resources/images/uploads/trailer6.jpg" alt="photo by Joshua Earle">
                                    </div>
                                    <div class="trailer-infor">
                                        <h4 class="desc">Exclusive Interview:  Skull Island</h4>
                                        <p>2:44</p>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="trailer-img">
                                        <img src="resources/images/uploads/trailer3.png" alt="photo by Alexander Dimitrov" width="100" height="56">
                                    </div>
                                    <div class="trailer-infor">
                                        <h4 class="desc">Logan: Director James Mangold Interview</h4>	
                                        <p>2:43</p>
                                    </div>
                                </div>
                                <div class="item">
                                    <div class="trailer-img">
                                        <img src="resources/images/uploads/trailer4.png"  alt="photo by Wojciech Szaturski" width="100" height="56">
                                    </div>
                                    <div class="trailer-infor">
                                        <h4 class="desc">Beauty and the Beast: Official Teaser Trailer 2</h4>	
                                        <p>2: 32</p>
                                    </div>	
                                </div>
                                <div class="item">
                                    <div class="trailer-img">
                                        <img src="resources/images/uploads/trailer5.jpg"  alt="photo by Wojciech Szaturski" width="360" height="189">
                                    </div>
                                    <div class="trailer-infor">
                                        <h4 class="desc">Fast&Furious 8</h4>	
                                        <p>3:11</p>
                                    </div>	
                                </div>

                            </div>
                        </div>   
                    </div>
                </div>
            </div>
        </div>

        <!-- footer section-->
        <footer class="ht-footer">
            <div class="container">
                <div class="flex-parent-ft">
                    <div class="flex-child-ft item1">
                        <a href="#"><img class="logo" src="resources/images/logo1.png" alt=""></a>
                        <p>5th Avenue st, manhattan<br>
                            New York, NY 10001</p>
                        <p>Call us: <a href="#">(+01) 202 342 6789</a></p>
                    </div>
                    <div class="flex-child-ft item2">
                        <h4>Resources</h4>
                        <ul>
                            <li><a href="#">About</a></li> 
                            <li><a href="#">Blockbuster</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">Forums</a></li>
                            <li><a href="#">Blog</a></li>
                            <li><a href="#">Help Center</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item3">
                        <h4>Legal</h4>
                        <ul>
                            <li><a href="#">Terms of Use</a></li> 
                            <li><a href="#">Privacy Policy</a></li>	
                            <li><a href="#">Security</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item4">
                        <h4>Account</h4>
                        <ul>
                            <li><a href="#">My Account</a></li> 
                            <li><a href="#">Watchlist</a></li>	
                            <li><a href="#">Collections</a></li>
                            <li><a href="#">User Guide</a></li>
                        </ul>
                    </div>
                    <div class="flex-child-ft item5">
                        <h4>Newsletter</h4>
                        <p>Subscribe to our newsletter system now <br> to get latest news from us.</p>
                        <form action="#">
                            <input type="text" placeholder="Enter your email...">
                        </form>
                        <a href="#" class="btn">Subscribe now <i class="ion-ios-arrow-forward"></i></a>
                    </div>
                </div>
            </div>
            <div class="ft-copyright">
                <div class="ft-left">
                    <p><a target="_blank" href="https://www.templateshub.net">Templates Hub</a></p>
                </div>
                <div class="backtotop">
                    <p><a href="#" id="back-to-top">Back to top  <i class="ion-ios-arrow-thin-up"></i></a></p>
                </div>
            </div>
        </footer>
        <!-- end of footer section
        <script src="js/jquery.js"></script>
        <script src="js/plugins.js"></script>
        <script src="js/plugins2.js"></script>
        <script src="js/custom.js"></script>
        -->



        <script src="<c:url value="/resources/js/jquery.js"/>"></script>
        <script src="<c:url value="/resources/js/plugins.js"/>"></script>
        <script src="<c:url value="/resources/js/plugins2.js"/>"></script>
        <script src="<c:url value="/resources/js/custom.js"/>"></script>
    </body>


</html>
