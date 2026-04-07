<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="WEB_Alquisoft.contact" %>

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
    <title>AlquiSoft - Software para administración de Alquileres | Contacto</title>
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
                        <h2 class="w3ltop-title">Contacto</h2>
                    </div>
                    <ul class="breadcrumbs-custom-path">
                        <li><a href="index.aspx">Inicio</a></li>
                        <li class="active"><span class="fas fa-arrow-right mx-2"></span> Contacto </li>
                    </ul>
                </div>
            </div>
        </div>
    </section>
    <!--//breadcrumb-->
    <!--/contact-form-->
    <section class="w3l-contact-main py-5" id="contact">
        <div class="container py-lg-5 py-md-3">
            <div class="w3header-section text-center mb-md-5 mb-4">
                <h6 class="title-subhny">Información de Contacto</h6>
                <h3 class="title-w3l mb-5">
                    Coordinemos un café y hablemos de<br> Su necesidad</h3>

            </div>

            <div class="w3l-contact-info">
                <div class="row contact-infos">
                    <div class="col-lg-4 col-md-6">
                        <div class="single-contact-infos">
                            <div class="icon-box"> <span class="fas fa-map-marked-alt"></span></div>
                            <div class="text-box">
                                <h3 class="mb-2">Dirección</h3>
                                <p>Zona Idustrial Pavas.</p>
								<br>                                                              
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-md-0 mt-4">
                        <div class="single-contact-infos">
                            <div class="icon-box"> <span class="fas fa-phone-alt"></span></div>
                            <div class="text-box">
                                <h3 class="mb-2">Teléfono</h3>
                                <p><a href="tel:+506 8479-6390">+506 8479-6390</a></p>
								<br>
                                </div>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-lg-0 mt-4">
                        <div class="single-contact-infos">
                            <div class="icon-box"> <span class="fas fa-envelope-open-text"></span></div>
                            <div class="text-box">
                                <h3 class="mb-2">Correo Electrónico</h3>
                                <p> <a href="mailto:info@alquisoft.com">info@alquisoft.com</a></p>
                                <p> <a href="mailto:soporte@alquisoft.com">soporte@alquisoft.com</a></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!--/contact-map-->
    <section class="w3l-contact-main" id="contact">
        <div class="map pt-lg-3">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d13038.143261305962!2d-84.1433162114381!3d9.94525374251603!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8fa0fb626b853b47%3A0xdc9a264881d3aee0!2sZona%20Industrial%20Condal%20Pavas%20II!5e1!3m2!1ses-419!2scr!4v1775543454979!5m2!1ses-419!2scr" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
    </section>
    <!--//contact-map-->
    <!--/contact-form-->
    <section class="w3l-contact-main" id="contact">
        <div class="contact-infhny py-5">
            <div class="container py-lg-5">
                <div class="top-map">
                    <div class="map-content-9">
                        <form action="https://sendmail.w3layouts.com/submitForm" method="post">
                            <div class="form-top1">
                                <div class="w3header-section text-center">
                                    <h6 class="title-subhny">Contáctenos </h6>
                                    <h3 class="title-w3l mb-0">
                                        Rellene el formulario y trabajemos juntos</h3>
                                    <p class="mb-lg-5 mb-4 text-center">Cada formulario es respondido, no importa la cantidad de sus alquileres, cada mensaje nos da felicidad</p>
                                </div>

                                <div class="form-top">
                                    <div class="form-top-left">
                                        <input type="text" name="w3lName" id="w3lName" placeholder="Nombre*" required="">
                                        <input type="number" name="w3lPhone" placeholder="Número de teléfono*" required="">
                                        <input type="email" name="w3lSender" id="w3lSender" placeholder="Correo electrónico*" required="">
                                        <input type="text" name="w3lSubject" id="w3lName" placeholder="Asunto" required="">
                                    </div>
                                    <div class="form-top-righ">
                                        <textarea name="w3lMessage" id="w3lMessage" placeholder="Escriba su consulta*" required=""></textarea>
                                    </div>
                                </div>
                                <div class="text-lg-right text-center">
                                    <button type="submit" class="btn btn-style btn-primary">Enviar ahora <i class="fas fa-paper-plane ms-2"></i></button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//contact-form-->
	
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

