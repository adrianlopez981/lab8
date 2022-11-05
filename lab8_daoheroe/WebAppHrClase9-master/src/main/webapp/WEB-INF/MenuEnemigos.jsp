<%--
  Created by IntelliJ IDEA.
  User: Anais
  Date: 5/11/2022
  Time: 18:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <title>Menu Enemigos</title>
  <style>
    body {
      background: url("1x/fondo_oscuro.png");
      background-position: center center;
      background-size: cover;
      background-repeat: no-repeat;
      background-attachment: fixed;
      margin: 0;
      height: 100vh;

    }
    @font-face {
      font-family: Decor;
      src: url(KrinkesDecorPERSONAL.ttf);
    }
    @font-face{
      font-family: Decor;
      src: url(KrinkesRegularPERSONAL.ttf);
      font-style: italic;
    }
    p{
      font-family: Decor;
      font-family: 'Luminari', sans-serif;
    }
    .botones {
      width: 100%;
      text-align: center;
    }

    .botones {
      width: 100%;
      text-align: center;
    }

    #separar {
      padding: 3%;
      display: inline-block;
    }

    .titulo {
      font-family: Arial, Helvetica, sans-serif;
      font-size: 20px;
      text-decoration: underline;
      color: #E86F6F;
    }
    .boton4 {
      color: rgba(255, 255, 255, 0.9) !important;
      font-size: 20px;
      font-weight: 500;
      padding: 0.5em 1.2em;
      background: #B82323;
      border: 0px solid;
      border-color: #B82323;
      position: relative;
    }
    .boton4:hover {
      color: rgba(255, 255, 255, 1) !important;
      box-shadow: 0 4px 16px rgba(251, 152, 152, 1);
      transition: all 0.2s ease;
    }

    @import url(https://fonts.googleapis.com/css?family=Ubuntu:400,700);
    * {
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
    }

    ul {
      list-style-type: none;
      margin: 0;
      padding-left: 0;
    }

    h1 {
      font-size: 23px;
    }

    h2 {
      font-size: 17px;
    }

    p {
      font-size: 15px;
    }

    a {
      text-decoration: none;
      font-size: 15px;
    }
    a:hover {
      text-decoration: underline;
    }

    h1, h2, p, a, span{
      color: #fff;
    }
    .scnd-font-color {
      color: #9099b7;
    }
    .titular {
      display: block;
      line-height: 60px;
      margin: 0;
      text-align: center;
      border-top-left-radius: 5px;
      border-top-right-radius: 5px;
    }
    .horizontal-list {
      margin: 0;
      padding: 0;
      list-style-type: none;
    }
    .horizontal-list li {
      float: left;
    }
    .block {
      margin: 25px 25px 0 0;
      background: #0A520F50;
      border-radius: 5px;
      float: left;
      width: 300px;
      overflow: hidden;
    }
    /******************************************** LEFT CONTAINER *****************************************/
    .left-container {}
    .menu-box {
      height: 360px;
    }

    .donut-chart-block {
      overflow: hidden;
    }
    .donut-chart-block .titular {
      padding: 10px 0;
    }
    .os-percentages li {
      width: 75px;
      border-left: 1px solid #0A520F;
      text-align: center;
      background: #18982190;
    }
    .os {
      margin: 0;
      padding: 10px 0 5px;
      font-size: 15px;
    }
    .os.ios {
      border-top: 4px solid #e64c65;
    }
    .os.mac {
      border-top: 4px solid #11a8ab;
    }
    .os.linux {
      border-top: 4px solid #fcb150;
    }
    .os.win {
      border-top: 4px solid #4fc4f6;
    }
    .os-percentage {
      margin: 0;
      padding: 0 0 15px 10px;
      font-size: 25px;
    }
    .line-chart-block, .bar-chart-block {
      height: 400px;
    }
    .line-chart {
      height: 200px;
      background: #11a8ab;
    }
    .time-lenght {
      padding-top: 22px;
      padding-left: 38px;
      overflow: hidden;
    }
    .time-lenght-btn {
      display: block;
      width: 70px;
      line-height: 32px;
      background: #50597b;
      border-radius: 5px;
      font-size: 14px;
      text-align: center;
      margin-right: 5px;
      -webkit-transition: background .3s;
      transition: background .3s;
    }
    .time-lenght-btn:hover {
      text-decoration: none;
      background: #e64c65;
    }
    .month-data {
      padding-top: 28px;
    }
    .month-data p {
      display: inline-block;
      margin: 0;
      padding: 0 25px 15px;
      font-size: 16px;
    }
    .month-data p:last-child {
      padding: 0 25px;
      float: right;
      font-size: 15px;
    }
    .increment {
      color: #e64c65;
    }

    /******************************************
    GRAFICO CIRCULAR PIE CHART
    ******************************************/
    .donut-chart {
      position: relative;
      width: 200px;
      height: 200px;
      margin: 0 auto 2rem;
      border-radius: 100%
    }
    p.center-date {
      background: #0A520F;
      position: absolute;
      text-align: center;
      font-size: 28px;
      top:0;left:0;bottom:0;right:0;
      width: 130px;
      height: 130px;
      margin: auto;
      border-radius: 50%;
      line-height: 35px;
      padding: 15% 0 0;
    }
    .center-date span.scnd-font-color {
      line-height: 0;
    }
    .recorte {
      border-radius: 50%;
      clip: rect(0px, 200px, 200px, 100px);
      height: 100%;
      position: absolute;
      width: 100%;
    }
    .quesito {
      border-radius: 50%;
      clip: rect(0px, 100px, 200px, 0px);
      height: 100%;
      position: absolute;
      width: 100%;
      font-family: monospace;
      font-size: 1.5rem;
    }
    #porcion1 {
      transform: rotate(0deg);
    }

    #porcion1 .quesito {
      background-color: #E64C65;
      transform: rotate(76deg);
    }
    #porcion2 {
      transform: rotate(76deg);
    }
    #porcion2 .quesito {
      background-color: #11A8AB;
      transform: rotate(140deg);
    }
    #porcion3 {
      transform: rotate(215deg);
    }
    #porcion3 .quesito {
      background-color: #4FC4F6;
      transform: rotate(113deg);
    }
    #porcionFin {
      transform:rotate(-32deg);
    }
    #porcionFin .quesito {
      background-color: #FCB150;
      transform: rotate(32deg);
    }
    .nota-final {
      clear: both;
      color: #4FC4F6;
      font-size: 1rem;
      padding: 2rem 0;
    }
    .nota-final strong {
      color: #E64C65;
    }
    .nota-final a {
      color: #FCB150;
      font-size: inherit;
    }


    }
  </style>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
  <link href="https://fonts.cdnfonts.com/css/luminari" rel="stylesheet">
  <link href="/assets/css/main.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/notie@4.3.1/dist/notie.min.css" rel="stylesheet">
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/google/code-prettify@master/loader/prettify.css">
  <link href="https://fonts.cdnfonts.com/css/andale-mono" rel="stylesheet">
  <link href="https://fonts.cdnfonts.com/css/american-typewriter" rel="stylesheet">
</head>

<body class="p-3 m-0 border-0 bd-example">
<header style="background-color: #5F975060; ">
  <div class="container" >
    <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
      <a class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
        <img src="1x/logo.png"  width="50 px" height="50 px">
      </a>

      <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
        <li><a href="MenuPrincipal.html" class="nav-link px-2"><b style="color:#CDEFB4">Menú Principal</b></a></li>
        <li><a href="MenuHeroes.html" class="nav-link px-2 text-white">Menú Héroes</a></li>
        <li><a href="MenuEnemigos.html" class="nav-link px-2 text-white">Menú Enemigos</a></li>
        <li><a href="MenuHechizos.html" class="nav-link px-2 text-white">Menú Hechizos</a></li>
        <li><a href="CatalogoObjetos.html" class="nav-link px-2 text-white">Catálogo Objetos</a></li>
      </ul>

      <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
        <table>
          <tr>
            <td><input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Buscar..." aria-label="Search"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><a href="Inicio.html" style="color:#ECE987"><b>SALIR ></b></a></td>
        </table>
    </div>
  </div>
</header>
<br>
<br>
<center>
  <div class="d-flex justify-content-center">
    <div class="card">
      <div class="card-body" style="background-color:#F2FDE8">
        <div class="p-7 mb-2 bg-primary text-white">
          <h4 style="text-align: center; color: white; font-family:'Times New Roman', Times, serif; background-color:#529EAB" >REPORTE  DE  ENEMIGOS</h4>
        </div>

        <table class="table">
          <thead>
          <tr>
            <th scope="col"><a title="Clases Enemigos" href="clasesEnemigos.html" style="color:#5F8AB5"><img src="1x/vectorEnemigo.png" alt="Clases Enemigos" width="70 px" height="70 px"/>Vea >> Clases Enemigos</a></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th></th>
            <th scope="col"><a href="AnadirEnemigo.html"><button type="button" class="btn btn-danger">Añadir >></button></a></th>
          </tr>
          </thead>
        </table>

        <center>
          <table class="table">

            <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nombre</th>
              <th scope="col">Clase</th>
              <th scope="col">Ataque</th>
              <th scope="col">Experiencia</th>
              <th scope="col">Objeto</th>
              <th scope="col">O. Genero</th>
              <th scope="col"></th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
            <tr>
              <th scope="row">1</th>
              <td>Mark</td>
              <td>Masculino</td>
              <td>Clase tipo</td>
              <td>8</td>
              <td>159</td>
              <td>Rosa</td>

              <td>
                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                  <a href="EditarEnemigo.html" class="btn btn-success" >Editar</a>
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Eliminar
                  </button>

                  <!-- Modal -->
                  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="exampleModalLabel" style="color:#06380A">ELIMINAR JUGADOR</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          ¿Estás seguro de eliminar?
                        </div>
                        <div class="modal-footer">
                          <a href="MenuEnemigos.html"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                          <a href="MenuEnemigos.html"><button type="button" class="btn btn-primary">Eliminar</button></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </td>
            </tr>
            <tr>
              <th scope="row">1</th>
              <td>Mark</td>
              <td>Masculino</td>
              <td>Clase tipo</td>
              <td>8</td>
              <td>159</td>
              <td>Rosa</td>

              <td>
                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                  <a href="EditarEnemigo.html" class="btn btn-success" >Editar</a>
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Eliminar
                  </button>

                  <!-- Modal -->
                  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="exampleModalLabel" style="color:#06380A">ELIMINAR JUGADOR</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          ¿Estás seguro de eliminar?
                        </div>
                        <div class="modal-footer">
                          <a href="MenuEnemigos.html"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                          <a href="MenuEnemigos.html"><button type="button" class="btn btn-primary">Eliminar</button></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </td>
            </tr>
            <tr>
              <th scope="row">1</th>
              <td>Mark</td>
              <td>Masculino</td>
              <td>Clase tipo</td>
              <td>8</td>
              <td>159</td>
              <td>Rosa</td>

              <td>
                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                  <a href="EditarEnemigo.html" class="btn btn-success" >Editar</a>
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Eliminar
                  </button>

                  <!-- Modal -->
                  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="exampleModalLabel" style="color:#06380A">ELIMINAR JUGADOR</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          ¿Estás seguro de eliminar?
                        </div>
                        <div class="modal-footer">
                          <a href="MenuEnemigos.html"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                          <a href="MenuEnemigos.html"><button type="button" class="btn btn-primary">Eliminar</button></a>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>

              </td>
            </tr>
            <tr>
              <th scope="row">1</th>
              <td>Mark</td>
              <td>Masculino</td>
              <td>Clase tipo</td>
              <td>8</td>
              <td>159</td>
              <td>Rosa</td>

              <td>
                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                  <a href="EditarEnemigo.html" class="btn btn-success" >Editar</a>
                  <!-- Button trigger modal -->
                  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Eliminar
                  </button>

                  <!-- Modal -->
                  <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                      <div class="modal-content">
                        <div class="modal-header">
                          <h1 class="modal-title fs-5" id="exampleModalLabel" style="color:#06380A">ELIMINAR JUGADOR</h1>
                          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                          ¿Estás seguro de eliminar?
                        </div>
                        <div class="modal-footer">
                          <a href="MenuEnemigos.html"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                          <a href="MenuEnemigos.html"><button type="button" class="btn btn-primary">Eliminar</button></a>
                        </div>
                      </div>
                    </div>
                  </div>

                </div>

              </td>
            </tr>
            </tbody>
          </table>

      </div>

    </div>
  </div>
</center>
<br>

<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>

<center>
  <div class="container">
    <!-- DONUT CHART BLOCK (LEFT-CONTAINER) -->
    <div class="donut-chart-block block">
      <h2 class="titular">Enemigos comunes</h2>
      <div class="donut-chart">
        <!-- PORCIONES GRAFICO CIRCULAR
             ELIMINADO #donut-chart
             MODIFICADO CSS de .donut-chart -->
        <div id="porcion1" class="recorte"><div class="quesito ios" data-rel="21"></div></div>
        <div id="porcion2" class="recorte"><div class="quesito mac" data-rel="39"></div></div>
        <div id="porcion3" class="recorte"><div class="quesito win" data-rel="31"></div></div>
        <div id="porcionFin" class="recorte"><div class="quesito linux" data-rel="9"></div></div>
        <!-- FIN AÑADIDO GRÄFICO -->
        <p class="center-date">Clase<br><span class="scnd-font-color">Enemigos</span></p>
      </div>
      <ul class="os-percentages horizontal-list">
        <li>
          <p class="ios os scnd-font-color">Clase 1</p>
          <p class="os-percentage">21<sup>%</sup></p>
        </li>
        <li>
          <p class="mac os scnd-font-color">Clase 2</p>
          <p class="os-percentage">39<sup>%</sup></p>
        </li>
        <li>
          <p class="linux os scnd-font-color">Clase 3</p>
          <p class="os-percentage">9<sup>%</sup></p>
        </li>
        <li>
          <p class="win os scnd-font-color">Clase 4</p>
          <p class="os-percentage">31<sup>%</sup></p>
        </li>
      </ul>
    </div>
  </div>
  <div class="container">
    <!-- DONUT CHART BLOCK (LEFT-CONTAINER) -->
    <div class="donut-chart-block block">
      <h2 class="titular">Objetos comunes</h2>
      <div class="donut-chart">
        <!-- PORCIONES GRAFICO CIRCULAR
             ELIMINADO #donut-chart
             MODIFICADO CSS de .donut-chart -->
        <div id="porcion1" class="recorte"><div class="quesito ios" data-rel="21"></div></div>
        <div id="porcion2" class="recorte"><div class="quesito mac" data-rel="39"></div></div>
        <div id="porcion3" class="recorte"><div class="quesito win" data-rel="31"></div></div>
        <div id="porcionFin" class="recorte"><div class="quesito linux" data-rel="9"></div></div>
        <!-- FIN AÑADIDO GRÄFICO -->
        <p class="center-date">Nombre<br><span class="scnd-font-color">Objeto</span></p>
      </div>
      <ul class="os-percentages horizontal-list">
        <li>
          <p class="ios os scnd-font-color">Arma 1</p>
          <p class="os-percentage">21<sup>%</sup></p>
        </li>
        <li>
          <p class="mac os scnd-font-color">Arma 2</p>
          <p class="os-percentage">39<sup>%</sup></p>
        </li>
        <li>
          <p class="linux os scnd-font-color">Arma 3</p>
          <p class="os-percentage">9<sup>%</sup></p>
        </li>
        <li>
          <p class="win os scnd-font-color">Arma 4</p>
          <p class="os-percentage">31<sup>%</sup></p>
        </li>
      </ul>
    </div>
  </div>
  <div class="container">
    <!-- DONUT CHART BLOCK (LEFT-CONTAINER) -->
    <div class="donut-chart-block block">
      <h2 class="titular">Enemigos</h2>
      <div class="donut-chart">
        <!-- PORCIONES GRAFICO CIRCULAR
             ELIMINADO #donut-chart
             MODIFICADO CSS de .donut-chart -->
        <div id="porcion1" class="recorte"><div class="quesito ios" data-rel="21"></div></div>
        <div id="porcion2" class="recorte"><div class="quesito mac" data-rel="39"></div></div>
        <div id="porcion3" class="recorte"><div class="quesito win" data-rel="31"></div></div>
        <div id="porcionFin" class="recorte"><div class="quesito linux" data-rel="9"></div></div>
        <!-- FIN AÑADIDO GRÄFICO -->
        <p class="center-date">Sin<br><span class="scnd-font-color">Género</span></p>
      </div>
      <ul class="os-percentages horizontal-list">
        <li>
          <p class="ios os scnd-font-color">Enemigo 1</p>
          <p class="os-percentage">21<sup>%</sup></p>
        </li>
        <li>
          <p class="mac os scnd-font-color">Enemigo 2</p>
          <p class="os-percentage">39<sup>%</sup></p>
        </li>
        <li>
          <p class="linux os scnd-font-color">Enemigo 3</p>
          <p class="os-percentage">9<sup>%</sup></p>
        </li>
        <li>
          <p class="win os scnd-font-color">Arma 4</p>
          <p class="os-percentage">31<sup>%</sup></p>
        </li>
      </ul>
    </div>
  </div>
  <br>
  <br>
  <style>
    .custom-font {
      font-family: "Luminari", Courier;
      font-display: swap;
      font-weight: 400;
    }
  </style>
  <style>
    @import url('https://fonts.cdnfonts.com/css/andale-mono');
  </style>
  <style>
    @import url('https://fonts.cdnfonts.com/css/american-typewriter');
  </style>
  <br>
  <br>

</body>

</html>


