<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="WEB_Alquisoft.about" %>

<!--
Author: W3layouts
Author URL: http://w3layouts.com
-->
<!doctype html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>AlquiSoft - Software para administración de Alquileres | Soporte</title>
    <!--/google-fonts -->
    <link href="//fonts.googleapis.com/css2?family=DM+Sans:ital,wght@0,400;0,700;1,700&display=swap" rel="stylesheet">
    <!--//google-fonts -->
    <!-- Template CSS -->
    <link rel="stylesheet" href="assets/css/style-starter.css">
</head>
<!--/Header-->

<body>
    <header id="site-header" class="fixed-top">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light stroke py-lg-0">
                <h1><a class="navbar-brand pe-xl-5 pe-lg-4" href="index.aspx">
                        <!--Alqui<span class="log">Soft</span>-->
						<img src="assets/images/logo.png" alt="AlquiSoft Logo" style="height:80px;">
                    </a></h1>
                <button class="navbar-toggler collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#navbarScroll" aria-controls="navbarScroll" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon fa icon-expand fa-bars"></span>
                    <span class="navbar-toggler-icon fa icon-close fa-times"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarScroll">
                    <ul class="navbar-nav me-lg-auto my-2 my-lg-0 navbar-nav-scroll">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="index.aspx">Inicio</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="about.aspx">Soporte</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="services.aspx">Planes</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.aspx">Contacto</a>
                        </li>

                    </ul>
                    <!--/search-right-->
                    <ul class="header-search d-flex mx-lg-4">
                        <li class="nav-item search-right">
                            <a href="#search" class="" title="search"> <span class="fas fa-search me-lg-4" aria-hidden="true"></span></a>
                            <!-- search popup -->
                            <div id="search" class="pop-overlay">
                                <div class="popup">
                                    <h3 class="title-w3l two mb-4 text-left">Buscar aquí</h3>
                                    <form action="#" method="GET" class="search-box d-flex position-relative">
                                        <input type="search" placeholder="Escriba la palabra clave " name="search" required="required" autofocus="">
                                        <button type="submit" class="btn btn-primary"><span class="fas fa-search" aria-hidden="true"></span></button>
                                    </form>
                                </div>
                                <a class="close" href="#close">×</a>
                            </div>
                            <!-- /search popup -->
                        </li>
                        <li class="nav-item propertyw3-btnhny">
                            <a href="contact.aspx" class="btn btn-style btn-secondary">Conversemos</a>


                        </li>
                    </ul>
                    <!--//search-right-->
                </div>
                <!-- toggle switch for light and dark theme -->
                <div class="mobile-position">
                    <nav class="navigation">
                        <div class="theme-switch-wrapper">
                            <label class="theme-switch" for="checkbox">
                                <input type="checkbox" id="checkbox">
                                <div class="mode-container">
                                    <i class="gg-sun"></i>
                                    <i class="gg-moon"></i>
                                </div>
                            </label>
                        </div>
                    </nav>
                </div>
                <!-- //toggle switch for light and dark theme -->
            </nav>
        </div>
    </header>
    <!--//Header-->
    <!-- breadcrumb -->
    <section class="w3l-about-breadcrumb">
        <div class="breadcrumb-bg breadcrumb-bg-about">
            <div class="container py-5">
                <div class="w3breadcrumb-gids text-center py-sm-5 py-4">
                    <div class="w3breadcrumb-info">
                        <h2 class="w3ltop-title">Soporte</h2>
                    </div>
                    <ul class="breadcrumbs-custom-path">
                        <li><a href="index.aspx">Inicio</a></li>
                        <li class="active"><span class="fas fa-arrow-right mx-2"></span> Soporte </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!--//breadcrumb-->
    <!--/about-page-->
    <section class="w3l-ab-page py-5" id="about1">
        <div class="container py-lg-5 py-md-4 py-2 ">

            <div class="title-content text-left">
                <h6 class="title-subhny">Nuestra prioridad es usted</h6>
                <h3 class="title-w3l mb-2">Creamos soluciones, pero lo acompañamos siempre
                </h3>
            </div>
            <div class="row mt-5 pb-1 ab-inf-stat position-relative">
                <div class="col-lg-7 abw3-img mb-lg-0 mb-5">
                    <img src="assets/images/banner2.jpg" alt="" class="img-fluid radius-image">

                </div>
                <div class="col-lg-5 ps-lg-5">
                    <p>Con nuestro sistema de soporte, usted podrá crear tickets o chatear con un ejecutivo según su plan contratado</p>
                    <div class="w3banner-content-btns d-flex">
                        <a href="services.aspx" class="btn btn-style btn-primary mt-lg-5 mt-4">Elije su plan </a>

                    </div>
                    <div class="w3l-stats-inner-inf">
                        <div class="row stats-con">
                            <div class="col-6 stats_info counter_grid">
                                <div class="stats_infoinhny">
                                    <p class="counter">100% </p>
                                    <h3>Garantía de satisfacción</h3>
                                </div>
                            </div>

                            <div class="col-6 stats_info counter_grid">
                                <div class="stats_infoinhny">
                                    <p class="counter">+600 </p>
                                    <h3>Casos de éxito en el último año</h3>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
    	
    <!--/team-sec-->
    <section class="w3l-team-main team py-1" id="team">
        <div class="container py-lg-5">
            <div class="text-center mb-2">
                <h6 class="title-subhny">Nuestro Equipo</h6>
                <h3 class="title-w3l">Trabajamos para usted.</h3>
            </div>
            <div class="row team-row justify-content-center">
                <div class="col-lg-3 col-6 team-wrap mt-lg-5 mt-4">
                    <div class="member">
                        <div class="member-img">
                            <img src="assets/images/team1.jpg" alt="" class="img-fluid radius-image">
                            <div class="social">
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Saúl Campos</h4>
                            <span>Director Ejecutivo</span>
                        </div>
                    </div>
                </div>
                <!-- end team member -->
                <div class="col-lg-3 col-6 team-wrap mt-lg-5 mt-4">
                    <div class="member">
                        <div class="member-img">
                            <img src="assets/images/team2.jpg" alt="" class="img-fluid radius-image">
                            <div class="social">
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Francisco Lizano</h4>
                            <span>Director General</span>
                        </div>
                    </div>
                </div>
                <!-- end team member -->
                <div class="col-lg-3 col-6 team-wrap mt-lg-5 mt-4">
                    <div class="member">
                        <div class="member-img">
                            <img src="assets/images/team4.jpg" alt="" class="img-fluid radius-image">
                            <div class="social">
                                <a href=""><i class="fab fa-facebook-f"></i></a>
                                <a href=""><i class="fab fa-twitter"></i></a>
                                <a href=""><i class="fab fa-linkedin-in"></i></a>
                            </div>
                        </div>
                        <div class="member-info">
                            <h4>Esteban Fallas</h4>
                            <span>Director Financiero</span>
                        </div>
                    </div>
                </div>
                <!-- end team member -->
            </div>
		<!-- slogan centrado debajo de las tarjetas -->
    <div class="text-center mt-5">
      <p class="team-slogan">“Expertos en distintas disciplinas, unidos por el desarrollo.”</p>
    </div>
        </div>
    </section>
    <!--//team-sec-->
	
    <!--/footer-->
   <footer class="w3l-footer">
  <div class="w3l-footer-16 py-3">
    <div class="container py-3">
      <div class="row footer-p">
        
        <!-- Columna 1: Logo + lema -->
<div class="col-lg-4 col-md-6 text-center">
  <h2 class="footerw3l-logo mb-2">
    <a class="navbar-brand" href="index.aspx">
      <img src="assets/images/logo.png" alt="AlquiSoft Logo" style="height:120px;">
    </a>
  </h2>
  <p class="footer-slogan">Gestione sus alquileres de forma inteligente</p>
</div>
        <!-- Columna 2: Teléfono + Dirección -->
        <div class="col-lg-4 col-md-6">
          <h3>Teléfono</h3>
          <p><a href="tel:+50684796390">+(506) 8479 6390</a></p>
          <h3 class="mt-3">Dirección</h3>
          <p>Zona Industrial de Pavas<br>San José - Costa Rica.</p>
        </div>

        <!-- Columna 3: Soporte + Redes sociales -->
        <div class="col-lg-4 col-md-6 text-center text-lg-start">
          <h3>Soporte</h3>
          <p><a href="mailto:soporte@alquisoft.com" class="mail">soporte@alquisoft.com</a></p>
          <h3 class="mt-3">Síguenos</h3>
          <ul class="social d-flex justify-content-center justify-content-lg-start">
            <li><a href="https://facebook.com/AlquiSoft"><i class="fab fa-facebook-f"></i></a></li>
            <li><a href="https://linkedin.com/AlquiSoft"><i class="fab fa-linkedin-in"></i></a></li>
          </ul>
        </div>

      </div>

      <!-- Sección inferior compacta -->
      <div class="below-section mt-3 pt-2">
        <div class="row align-items-center">
          <p class="copy-text col-lg-7 mb-0">
            &copy; 2026 AlquiSoft. Todos los derechos reservados. Diseñado por 
            <a href="https://esfransa.com/" target="_blank">ESFRANSA</a>
          </p>
          <div class="col-lg-5 w3footer-gd-links d-flex justify-content-lg-end justify-content-center">
            <a href="#privacy">Políticas de Privacidad</a>
            <a href="#terms" class="mx-3">Términos y Condiciones</a>
            <a href="#faq">FAQ</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</footer>
    <!-- //footer -->
    <!--/Js-scripts-->
    <!-- move top -->
    <button onclick="topFunction()" id="movetop" title="Go to top">
        <span class="fas fa-arrow-up" aria-hidden="true"></span>
    </button>
    <script>
        // When the user scrolls down 20px from the top of the document, show the button
        window.onscroll = function() {
            scrollFunction()
        };

        function scrollFunction() {
            if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
                document.getElementById("movetop").style.display = "block";
            } else {
                document.getElementById("movetop").style.display = "none";
            }
        }

        // When the user clicks on the button, scroll to the top of the document
        function topFunction() {
            document.body.scrollTop = 0;
            document.documentElement.scrollTop = 0;
        }

    </script>
    <!-- //move-top-->
    <!-- Template JavaScript -->
    <script src="assets/js/jquery-3.3.1.min.js"></script>
    <script src="assets/js/theme-change.js"></script>
    <!--/stats-number-counter-->
    <script src="assets/js/jquery.waypoints.min.js"></script>
    <script src="assets/js/jquery.countup.js"></script>
    <script>
        $('.counter').countUp();

    </script>
    <!--//stats-number-counter-->
    <!-- MENU-JS -->
    <script>
        $(window).on("scroll", function() {
            var scroll = $(window).scrollTop();

            if (scroll >= 80) {
                $("#site-header").addClass("nav-fixed");
            } else {
                $("#site-header").removeClass("nav-fixed");
            }
        });

        //Main navigation Active Class Add Remove
        $(".navbar-toggler").on("click", function() {
            $("header").toggleClass("active");
        });
        $(document).on("ready", function() {
            if ($(window).width() > 991) {
                $("header").removeClass("active");
            }
            $(window).on("resize", function() {
                if ($(window).width() > 991) {
                    $("header").removeClass("active");
                }
            });
        });

    </script>
    <!-- //MENU-JS -->

    <!-- disable body scroll which navbar is in active -->
    <script>
        $(function() {
            $('.navbar-toggler').click(function() {
                $('body').toggleClass('noscroll');
            })
        });

    </script>
    <!-- //disable body scroll which navbar is in active -->

    <!-- //bootstrap -->
    <script src="assets/js/bootstrap.min.js"></script>

</body>

</html>

