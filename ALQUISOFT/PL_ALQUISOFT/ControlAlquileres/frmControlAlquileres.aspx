<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="frmControlAlquileres.aspx.cs" Inherits="PL_ALQUISOFT.ControlAlquileres.frmControlAlquileres" %>


<!doctype html>
<html lang="en">

<head>
  <!-- Required meta tags -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <title>Sistema de Gestión de Tareas :: SpaceOps</title>

  <!-- Template CSS -->
  <link rel="stylesheet" href="assets/css/style-starter.css">

  <!-- google fonts -->
  <link href="//fonts.googleapis.com/css?family=Nunito:300,400,600,700,800,900&display=swap" rel="stylesheet">
</head>

<body class="sidebar-menu-collapsed">
<section>

  <!-- //sidebar menu end -->
  <!-- header-starts -->
  <div class="header sticky-header" style="height:100px;">

    <!-- notification menu start -->
    <div class="menu-right" style="padding-top: 20px;">
      <div class="navbar user-panel-top">
        <div class="logo" style="display: flex;justify-content: center;align-items: center;height: 100px;">
			<img src="../Login/images/Logo_SpaceOps.png" alt="Your logo" title="Your logo" class="img-fluid" style="height:200px;" />
		</div>
        <h1>Sistema de Gestión de Tareas | SpaceOps</h1>
        <div class="user-dropdown-details d-flex">
          
          <div class="profile_details">
            <ul>
              <li class="dropdown profile_details_drop">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" id="dropdownMenu3" aria-haspopup="true"
                  aria-expanded="false">
                  <div class="profile_img">
                    <img src="assets/images/profileimg.jpg" class="rounded-circle" alt="" />
                    <div class="user-active">
                      <span></span>
                    </div>
                  </div>
                </a>
                <ul class="dropdown-menu drp-mnu" aria-labelledby="dropdownMenu3">
                  <li class="user-info">
                    <h5 id="Usuario" class="user-name"></h5>
                    <span id="Email"  class="status ml-2"></span>
                  </li>
                  
                  <li class="logout" onclick="javascript: cerrarSesion()" ><a href="#sign-up.html"><i class="fa fa-power-off"></i> Cerrar Sesión</a> </li>
                </ul>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!--notification menu end -->
  </div>
  <!-- //header-ends -->
  <!-- main content start -->
<div class="main-content">

  <!-- content -->
  <div class="container-fluid content-top-gap">

    <nav aria-label="breadcrumb">
      <ol class="breadcrumb my-breadcrumb">
        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Dashboard</li>
      </ol>
    </nav>
    <div class="welcome-msg pt-3 pb-4">
      <h1>Hola <span class="text-primary" id="lblUsuario"></span>, Bienvenido</h1>
      <p id="lblEmail"></p>
    </div>

    <!-- statistics data -->
    <div class="statistics">
      <div class="row">
        <div class="col-xl-6 pr-xl-2">
          <div class="row">
            <div class="col-sm-6 pr-sm-2 statistics-grid">
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-book"> </i>
                <h3 class="text-primary number" id="TotalTareas"></h3>
                 <h4 style="text-align:right" class="stat-text">Total Tareas</h4>
              </div>
            </div>
            <div class="col-sm-6 pl-sm-2 statistics-grid">
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-book"> </i>
                <h3 class="text-secondary number" id="TotalPendientes"></h3>
                <h4 style="text-align:right" class="stat-text">Tareas Pendientes</h4>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-6 pl-xl-2">
          <div class="row">
            <div class="col-sm-6 pr-sm-2 statistics-grid">
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-book"> </i>
                <h3 class="text-success number" id="TotalEnProceso"></h3>
                <h4 style="text-align:right" class="stat-text">Tareas En Proceso</h4>
              </div>
            </div>
            <div class="col-sm-6 pl-sm-2 statistics-grid">
              <div class="card card_border border-primary-top p-4">
                <i class="lnr lnr-book"> </i>
                <h3 class="text-danger number" id="TotalFinalizadas"></h3>
                <h4 style="text-align:right" class="stat-text">Tareas Finalizadas</h4>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- //statistics data -->

    <!-- charts -->
    <div class="chart">
      <div class="row">
        <div class="col-lg-6 pl-lg-2 chart-grid">
          <div class="card text-center card_border">
            <div class="card-header chart-grid__header">
              Gráfico Pastel de Tareas x Estado
            </div>
            <div class="card-body">
              <!-- line chart -->
              <div id="container">
                <canvas id="grfTareasXEstadoPie"></canvas>
              </div>
              <!-- //line chart -->
            </div>
            <div class="card-footer text-muted chart-grid__footer">
              Actualizado Justo Ahora
            </div>
          </div>
        </div>
        <div class="col-lg-6 pl-lg-2 chart-grid">
          <div class="card text-center card_border">
            <div class="card-header chart-grid__header">
              Gráfico de Barras de Tareas x Prioridad
            </div>
            <div class="card-body">
              <!-- line chart -->
              <div id="container">
                <canvas id="grfTareasXPrioridadBarras"></canvas>
              </div>
              <!-- //line chart -->
            </div>
            <div class="card-footer text-muted chart-grid__footer">
              Actualizado Justo Ahora
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- //charts -->

    
    <!-- forms 4 -->
    <div class="card card_border py-2 mb-4">
		<div class="cards__heading">
            <h3>Filtros de Búsqueda de Tareas <span></span></h3>
        </div>
        <div class="card-body">
            <form action="javascript: cargaListaTareas()" method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="bsqTitulo" class="input__label">Título Tarea</label>
                        <input type="text" class="form-control input-style" id="bsqTitulo"
                            placeholder="Título de Tarea">
                    </div>
                    <div class="form-group col-md-6">
                        <label for="bsqEstado" class="input__label">Estado Tarea</label>
                        <select id="bsqEstado" class="form-control input-style">
                            
                        </select>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary btn-style mt-4">Buscar</button>
                <button type="button" class="btn btn-primary btn-style mt-4" onclick="javascript: crearTarea()">Crear</button>
            </form>
        </div>
    </div>
    <!-- //forms 4 -->

    <!-- forms 4 -->
    <div class="card card_border py-2 mb-4">
		<div class="cards__heading">
            <h3>Listado de Tareas <span></span></h3>
        </div>
        <div class="card-body">
            <table id="tblTareas">
                <!-- Definición de tabla aquí -->
            </table>
        </div>
    </div>
    <!-- //forms 4 -->
    
    <!-- Modal -->
    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
    aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
            <div class="modal-header">
                <h3>Mantenimiento de Tareas <span></span></h3>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <!-- forms 1 -->
                <div class="card card_border py-2 mb-4">
                    <div class="card-body">
                        <form action="javascript: mantenimientoTarea()" method="post">
                            <div class="form-group">
                                <label for="txtTitulo" class="input__label">Título</label>
                                <input type="text" class="form-control input-style" id="txtTitulo" placeholder="Título de Tarea">
                            </div>
                            <div class="form-group">
                                <label for="txtDescripcion" class="input__label">Descripción</label>
                                <input type="text" class="form-control input-style" id="txtDescripcion" placeholder="Descripción de Tarea">
                            </div>
                            <div class="form-group">
                                <label for="txtFecIni" class="input__label">Fecha Inicio</label>
                                <input type="date" class="form-control input-style" id="txtFecIni" required="">
                            </div>
                            <div class="form-group">
                                <label for="txtFecFin" class="input__label">Fecha Finalización</label>
                                <input type="date" class="form-control input-style" id="txtFecFin" required="">
                            </div>
                            <div class="form-group">
                                <label for="cboEstado" class="input__label">Estado</label>
                                <select id="cboEstado" class="form-control input-style">
                                    
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="cboPrioridad" class="input__label">Prioridad</label>
                                <select id="cboPrioridad" class="form-control input-style">
                                    
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="cboActividad" class="input__label">Actividad</label>
                                <select id="cboActividad" class="form-control input-style">
                                    
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary btn-style mt-4">Guardar</button>
                            <button type="button" class="btn btn-primary btn-style mt-4" data-dismiss="modal">Cerrar</button>
                        </form>
                    </div>
                </div>
                <!-- //forms 1 -->
            </div>
            </div>
        </div>
    </div>
    <!-- Modal -->
    

  </div>
  <!-- //content -->
</div>
<!-- main content end-->
</section>
  <!--footer section start-->
<footer class="dashboard">
  <p>&copy 2025 Sistema de Gestión de Tareas | <a href="#" class="text-primary">SpaceOps</a></p>
</footer>
<!--footer section end-->
<!-- move top -->
<button onclick="topFunction()" id="movetop" class="bg-primary" title="Go to top">
  <span class="fa fa-angle-up"></span>
</button>
<script>
  // When the user scrolls down 20px from the top of the document, show the button
  window.onscroll = function () {
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
<!-- /move top -->


<script src="assets/js/jquery-3.3.1.min.js"></script>
<script src="assets/js/jquery-1.10.2.min.js"></script>

<!-- chart js -->
<script src="assets/js/Chart.min.js"></script>
<script src="assets/js/utils.js"></script>
<!-- //chart js -->

<!-- Different scripts of charts.  Ex.Barchart, Linechart -->
<script src="assets/js/bar.js"></script>
<script src="assets/js/linechart.js"></script>
<!-- //Different scripts of charts.  Ex.Barchart, Linechart -->


<script src="assets/js/jquery.nicescroll.js"></script>
<script src="assets/js/scripts.js"></script>

<!-- close script -->
<script>
  var closebtns = document.getElementsByClassName("close-grid");
  var i;

  for (i = 0; i < closebtns.length; i++) {
    closebtns[i].addEventListener("click", function () {
      this.parentElement.style.display = 'none';
    });
  }
</script>
<!-- //close script -->

<!-- disable body scroll when navbar is in active -->
<script>
  $(function () {
    $('.sidebar-menu-collapsed').click(function () {
      $('body').toggleClass('noscroll');
    })
  });
</script>
<!-- disable body scroll when navbar is in active -->

 <!-- loading-gif Js -->
 <script src="assets/js/modernizr.js"></script>
 <script>
     $(window).load(function () {
         // Animate loader off screen
         $(".se-pre-con").fadeOut("slow");;
     });
 </script>
 <!--// loading-gif Js -->

<!-- Bootstrap Core JavaScript -->
<script src="assets/js/bootstrap.min.js"></script>
    
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../JavaScript/jquery.cookie.js"></script>
<script src="../JavaScript/InicioSesion.js"></script>

    
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.5/css/jquery.dataTables.min.css"/>
<script src="https://cdn.datatables.net/1.11.5/js/jquery.dataTables.min.js"></script>

<script src="../JavaScript/ControlAlquileres.js"></script>
<script src="../JavaScript/TaskCharts.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</body>

</html>
