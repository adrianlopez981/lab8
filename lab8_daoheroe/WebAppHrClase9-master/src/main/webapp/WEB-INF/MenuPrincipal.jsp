<%--
  Created by IntelliJ IDEA.
  User: Anais
  Date: 5/11/2022
  Time: 18:04
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
  <title>Menu Principal</title>
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
      color: #53932C;
    }
    .boton4 {
      color: rgba(255, 255, 255, 0.9) !important;
      font-size: 20px;
      font-weight: 500;
      padding: 0.5em 1.2em;
      background: #53932C;
      border: 0px solid;
      border-color: #53932C;
      position: relative;
    }
    .boton4:hover {
      color: rgba(255, 255, 255, 1) !important;
      box-shadow: 0 4px 16px rgba(245, 240, 144, 1);
      transition: all 0.2s ease;
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
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://getbootstrap.com/docs/5.2/assets/css/docs.css" rel="stylesheet">
  <title>Bootstrap Example</title>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"></script>
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
<center>
  <br>
  <div class="container marketing">

    <div class="row" style="width: 48rem">
      <h1 class="card-title" style="font-family:'Luminari';font-weight: 400;font-style: normal; background-color:#D4AF37; color:#FFF1A6">J U E G O</h1>
      <p></p>
      <h5 class="card-text" style="font-family: 'Times New Roman', Times, serif;color:#FBF9EB; background-color:#BBB9AD30"><b>Bienvenido Hechicero a este mundo mágico!</b><br>"La última fantasía" Agua, tierra, fuego y arie. Desde hace mucho tiempo el mundo se ha mantenido en paz y
        prosperidad gracias al poder de los cristales elementales. Sin embargo, Forond, el rey de la
        oscuridad se ha propuesto destruir estos cristales para ser el amo de la magia. Mold y su
        grupo de jóvenes aventureros parten en una travesía para poder proteger los cristales y
        vencer a Forond en su malvado plan.</h5>
      <p class="card-text"><small>Definición del juego</small></p>

    </div>
    <br>
    <br>
    <!-- Three columns of text below the carousel -->
    <div class="row">
      <div class="col-lg-3">
        <img class="rounded-circle" width="140" height="140" src="1x/diosInti.png"><rect width="100%" height="100%" src="1x/diosInti.png"></rect>
        <h2 class="fw-normal" style="font-family: 'Times New Roman', Times, serif;color:#FEF7B3">Héroes</h2>
        <p style="font-family: 'Times New Roman', Times, serif;color:#FEF7B3">Héroes dispuestos arriesgar su vida con el fin de detener los planes del malvado Forond.</p>
        <div id="separar">
          <a href="MenuHeroes.html"><button class="boton4" type="button" class="btn btn-primary btn-lg">
            <h5 style="font-weight: 200;font-style: normal; color:#FFFFFF" class="custom-font" data-lorem="1s">Ir a Menú »
            </h5>
          </button></a>
        </div>
      </div><!-- /.col-lg-4 -->


      <div class="col-lg-3">
        <img class="rounded-circle" width="140" height="140" src="1x/diosAztec.jpg"><rect width="100%" height="100%" src="1x/diosInti.png"></rect>
        <h2 class="fw-normal" style="font-family: 'Times New Roman', Times, serif;color:#DFEDFA">Enemigos</h2>
        <p style="font-family: 'Times New Roman', Times, serif;color:#DFEDFA">Seres malignos dispuestos a destruir a los héroes. Está liderado por el malvado Forond.</p>
        <div id="separar">
          <a href="MenuEnemigos.html"><button class="boton4" type="button" class="btn btn-primary btn-lg">
            <h5 style="font-weight: 200;font-style: normal; color:#FFFFFF" class="custom-font" data-lorem="1s">Ir a Menú »
            </h5>
          </button></a>
        </div>
      </div><!-- /.col-lg-4 -->

      <div class="col-lg-3">
        <img class="rounded-circle" width="140" height="140" src="1x/llama_verde.jpg"><rect width="100%" height="100%" src="1x/diosInti.png"></rect>
        <h2 class="fw-normal" style="font-family: 'Times New Roman', Times, serif;color:#CEFFBF">Hechizos</h2>
        <p style="font-family: 'Times New Roman', Times, serif;color:#CEFFBF">Poderosas armas elementales que se usa para poder liberar la guerra en este mundo tan hostil.</p>
        <div id="separar">
          <a href="MenuHechizos.html"><button class="boton4" type="button" class="btn btn-primary btn-lg">
            <h5 style="font-weight: 200;font-style: normal; color:#FFFFFF" class="custom-font" data-lorem="1s">Ir a Menú »
            </h5>
          </button></a>
        </div>
      </div><!-- /.col-lg-4 -->

      <div class="col-lg-3">
        <img class="rounded-circle" width="140" height="140" src="1x/arco.jpg"><rect width="100%" height="100%" src="1x/diosInti.png"></rect>

        <h2 class="fw-normal" style="font-family: 'Times New Roman', Times, serif;color:#D1EDE8">Catálogo</h2>
        <p style="font-family: 'Times New Roman', Times, serif;color:#D1EDE8">Catálogo de objetos a usar, es una vista que muestra toda la lista de objetos presentes en el videojuego.</p>
        <div id="separar">
          <a href="CatalogoObjetos.html"><button class="boton4" type="button" class="btn btn-primary btn-lg">
            <h5 style="font-weight: 200;font-style: normal; color:#FFFFFF" class="custom-font" data-lorem="1s">Ir a Menú »
            </h5>
          </button></a>
        </div>
      </div><!-- /.col-lg-4 -->
    </div><!-- /.row -->
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

</body>

</html>

