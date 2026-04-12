<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="WEB_Alquisoft.index" %>

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
    <title>AlquiSoft - Software para administración de Alquileres | Inicio</title>
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
    <!--//Banner-slider-->
    <section class="w3l-main-slider banner-slider position-relative" id="home">
        <div class="owl-one owl-carousel owl-theme">
            <div class="item">
                <div class="slider-info banner-view banner-top1">
                    <div class="container">
                        <div class="banner-info header-hero-19">
                            <p class="w3hny-tag">Gestione sus alquileres de forma fácil y segura con AlquiSoft.</p>
                            <h3 class="title-hero-19">Administre contratos, pagos y recordatorios en un solo lugar.</h3>
                            <a href="about.aspx" class="btn btn-style btn-primary mt-4">Conózcalo</a>

                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
    <!-- //main-slider -->

    <!--/w3-grids-->
    <section class="w3l-passion-mid-sec py-5">
        <div class="container py-md-5 py-3">
            <div class="row w3l-passion-mid-grids">
                <div class="col-lg-5 passion-grid-item-info mb-lg-0 mb-5 pe-lg-3">
                                        <h3 class="title-w3l mb-4">Alquisoft</h3>
                    <p class="mt-2 pe-lg-5">En Costa Rica y Latinoamérica, administrar alquileres puede ser complicado: pagos atrasados, contratos desordenados, falta de seguimiento. AlquiSoft simplifica todo con una plataforma SaaS accesible desde cualquier dispositivo	.</p>
                    <p class="mt-3 pe-lg-5">- Control de contratos y vencimientos</p>
					<p class="mt-4 pe-lg-5">- Condición de pago.</p>
					<p class="mt-5 pe-lg-5">- Monto del alquiler.</p>
					<p class="mt-5 pe-lg-5">- Información detallada del Inquilino.</p>
					<p class="mt-5 pe-lg-5">- Estado de los contratos.</p>

                </div>
                <div class="col-lg-7 passion-grid-item-info ps-lg-5">
                    <h3 class="title-w3l mb-4">Planes</h3>
                    <p class="mt-2 pe-lg-5">Tenemos diferentes planes que se adecuan a su presupuesto.</p>
                    <p class="mt-3 pe-lg-5">No permita que sus alquileres sean un dolor de cabeza.</p>
                    <div class="w3banner-content-btns">
                        <a href="services.aspx" class="btn btn-style btn-primary mt-lg-5 mt-4">Ver planes </a>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//w3-grids-->
    <!-- features-section -->
    <section class="w3l-features py-5" id="features">
        <div class="container py-lg-5">
            <div class="row pb-lg-5 mb-lg-5 pt-lg-3">
                <div class="col-lg-5 text-left">
                    <h6 class="title-subhny two">Características</h6>
                    <h3 class="title-w3l two">El mejor Software de Alquiler de Apartamentos</h3>
                </div>
                <div class="col-lg-7 text-left ps-lg-5">
                    <p class="w3p-white">Con nuestro software podrá solventar muchos de sus problemas en la adminsitración de alquileres de sus apartamentos.</p>
                </div>
            </div>
        </div>
    </section>
    <!--//features-section -->
    <!--/w3l-features-grids-->
    <section class="w3l-features-grids">
        <div class="container">
            <div class="main-cont-wthree-2">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 mt-lg-5 mt-4">
                        <div class="grids-1 box-wrap">
                            <div class="icon">
                                <i class="fas fa-paint-brush"></i>
                            </div>
                            <h4><a href="#service" class="title-head mb-3">Control de contratos</a></h4>
                            <p class="text-para">Información detallada de inicio y vencimiento. </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-lg-5 mt-4">
                        <div class="grids-1 box-wrap active">
                            <div class="icon">
                                <i class="fas fa-bullhorn"></i>
                            </div>
                            <h4><a href="#service" class="title-head mb-3">Condición de pago</a></h4>
                            <p class="text-para">Priorice siempre los contratos segun condición de pago. </p>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 mt-lg-5 mt-4">
                        <div class="grids-1 box-wrap">
                            <div class="icon">
                                <i class="fas fa-chart-line"></i>
                            </div>
                            <h4><a href="#service" class="title-head mb-3">Gráficas de sus alquileres</a></h4>
                            <p class="text-para">Control exhaustivo por medio de gráficos para mayor control. </p>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
    <!--//w3l-features-grids-->

    <!--/w3-grids-->
    <section class="w3l-passion-mid-sec py-5">
        <div class="container py-md-5 py-3">
            <div class="heading text-center mx-auto">
                <h6 class="title-subhny">Casos de uso</h6>
                <h3 class="title-w3l mb-3">Lo que hemos logrado</h3>
            </div>
            <!--/row-1-->
            <div class="w3l-passion-mid-grids w3recent-works mt-5">
                <!--/row-1-->
                <div class="row w3l-passion-mid-grids">
                    <div class="col-lg-6 w3grids-left-img p-0">
                        <img src="assets/images/g1.jpg" alt="" class="img-fluid">
                    </div>
                    <div class="col-lg-6 passion-grid-item-info p-0">
                        <div class="w3grids-right-info">
                            <div class="icon-text">
                                <h5>Alquiler de edificios</h5>
                                <h4><a href="#recent" class="title-head">
                                        Control de multiples alquileres.</a></h4>
                                <p class="text-para mt-2 mb-4">Un solo propietario podrá adminsitrar sus alquileres.</p>
                                <a href="#" class="read-more-icon"><i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--//row-1-->
                <!--/row-2-->
                <div class="row partrow-2 w3l-passion-mid-grids mt-lg-5 mt-4">
                    <div class="col-lg-6 passion-grid-item-info p-0">
                        <div class="w3grids-right-info">
                            <div class="icon-text">
                                <h5>Propietarios individuales</h5>
                                <h4><a href="#recent" class="title-head">
                                        La mejor idea si solo tiene un alquiler.</a></h4>
                                <p class="text-para mt-2 mb-4">Porque un solo alquiler puede ser sencillo de administrar.</p>
                                <a href="#" class="read-more-icon"><i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 w3grids-left-img p-0">
                        <img src="assets/images/g4.jpg" alt="" class="img-fluid">
                    </div>
                </div>
                <!--//row-2-->
                <!--/row-3-->
                <div class="row w3l-passion-mid-grids mt-lg-5 mt-4">
                    <div class="col-lg-6 w3grids-left-img p-0">
                        <img src="assets/images/g3.jpg" alt="" class="img-fluid">
                    </div>
                    <div class="col-lg-6 passion-grid-item-info p-0">
                        <div class="w3grids-right-info">
                            <div class="icon-text">
                                <h5>Agencias inmboliarias</h5>
                                <h4><a href="#recent" class="title-head">
                                        Gestión desatendida</a></h4>
                                <p class="text-para mt-2 mb-4">La mejor herramienta para Agencias inmobiliarias.</p>
                                <a href="#" class="read-more-icon"><i class="fas fa-arrow-right"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!--//row-3-->
            </div>
        </div>
    </section>
    <!--//w3-grids-->

    <!--/testimonials-->
<section class="w3l-clients w3l-bg-grey py-3" id="testimonials">
  <div class="container py-3">
    <div class="row w3-testimonial-grids align-items-center py-3">
      <div class="col-12 w3-testimonial-content-top">

        
        <div class="mb-4">
          <div class="item">
            <div class="testimonial-content">
              <div class="test-img">
                <img src="assets/images/team2.jpg" class="img-fluid" alt="client-img">
              </div>
              <div class="testimonial">
                <blockquote>
                  <q><i class="fas fa-quote-left me-2"></i>
                    "Con AlquiSoft reduje los atrasos de pago en un 80%. Ahora todo está en orden.”
                  </q>
                </blockquote>
                <div class="testi-des">
                  <div class="peopl align-self">
                    <h3>Elias Aguilar</h3>
                    <p class="indentity">San José, CR</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

        
        <div class="mb-4">
          <div class="item">
            <div class="testimonial-content">
              <div class="test-img">
                <img src="assets/images/team3.jpg" class="img-fluid" alt="client-img">
              </div>
              <div class="testimonial">
                <blockquote>
                  <q><i class="fas fa-quote-left me-2"></i>
                    "Gracias a AlquiSoft tengo control total de mis contratos y pagos. Es una herramienta indispensable.”
                  </q>
                </blockquote>
                <div class="testi-des">
                  <div class="peopl align-self">
                    <h3>María Fernández</h3>
                    <p class="indentity">Heredia, CR</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</section>
<!-- //testimonials -->
    <!--/video-->
    <section class="w3l-index5 py-5" id="video">
        <div class="container py-md-5">
            <div class="row bottom-ab-grids align-items-center">
                <div class="w3l-video-left col-lg-6 mb-lg-0 mb-5">
                   </span>
                        </a>
                        
                    </div>
                    
                </div>
                <div class="w3ab-left-top col-lg-6 mt-lg-0 mt-5 ps-lg-5">
                    <h6 class="title-subhny two">con AlquiSoft es posible</h6>
                    <h3 class="title-w3l two mb-2">Tranquilidad y Orden</h3>
                    <p class="my-3"> Descubra cómo AlquiSoft transforma la administración de alquileres en una experiencia simple y eficiente </p>
                    <a href="services.aspx" class="btn btn-style btn-primary mt-4">Conózcalo </a>
                </div>
            </div>
        </div>
    </section>
    <!--//video-->
    <!--/w3llets-work-->
    <section class="w3llets-work py-5">
        <div class="container py-md-5">
            <div class="row justify-content-center">
                <div class="w3llets-work-left col-lg-7">
                    <div class="text-lg-start text-center">
                        <h6 class="title-subhny">Trabajemos juntos</h6>
                        <h3 class="title-w3l">Tiene alguna duda?
                            Escríbanos y negociemos</h3>
                    </div>
                </div>
                <div class="w3llets-work-right col-lg-5 ps-lg-5 text-lg-end text-center">
                    <div class="w3banner-content-btns text-right">
                        <a href="contact.aspx" class="btn btn-style btn-primary mt-lg-5 mt-4"> Contáctenos </a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--//w3llets-work-->
    <!--/footer-->
   <footer class="w3l-footer">
  <div class="w3l-footer-16 py-3">
    <div class="container py-3">
      <div class="row footer-p">
        
        
<div class="col-lg-4 col-md-6 text-center">
  <h2 class="footerw3l-logo mb-2">
    <a class="navbar-brand" href="index.aspx">
      <img src="assets/images/logo.png" alt="AlquiSoft Logo" style="height:120px;">
    </a>
  </h2>
  <p class="footer-slogan">Gestione sus alquileres de forma inteligente</p>
</div>
        
        <div class="col-lg-4 col-md-6">
          <h3>Teléfono</h3>
          <p><a href="tel:+50684796390">+(506) 8479 6390</a></p>
          <h3 class="mt-3">Dirección</h3>
          <p>Zona Industrial de Pavas<br>San José - Costa Rica.</p>
        </div>

        
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
