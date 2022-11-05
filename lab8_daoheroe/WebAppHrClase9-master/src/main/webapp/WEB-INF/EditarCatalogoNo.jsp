<%--
  Created by IntelliJ IDEA.
  User: Anais
  Date: 5/11/2022
  Time: 18:07
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
  <title>Menu Heroes</title>
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


<div class="container marketing">

  <!-- START THE FEATURETTES -->

  <hr class="featurette-divider">

  <div class="row featurette" style="background-color:#09180380">
    <div class="col-md-5">
      <p></p>
      <br>
      <br>
      <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="350" height="350" src="1x/Arma.jpg"><rect width="100%" height="100%" src="1x/diosInti.png"></rect>
      <center><p class="card-text" style="font-weight: 400;font-style: normal; color:#FFF3A090"><small>Armas usadas por nuestros Héroes y Enemigos</small></p></center>
    </div>
    <div class="col-md-7">
      <p></p>
      <center><h1 style="font-weight: 400;font-style: normal; color:#F7E45F" class="custom-font" class="card-subtitle">C A T Á L O G O</h1></center>
      <center><p class="card-text" style="font-weight: 400;font-style: normal; color:#FFF3A090"><small>Editar</small></p></center>
      <p>
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Nombre del objeto:</span>
        <input type="text" class="form-control" placeholder="Ingrese Nombre del objeto" value="Clásico" aria-label="Username" aria-describedby="basic-addon1">
      </div>

      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Ingrese Efecto/Uso" value="Buen efecto" aria-label="Recipient's username" aria-describedby="basic-addon2">
        <span class="input-group-text" id="basic-addon2">: Efecto/Uso</span>
      </div>

      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon3">Peso :</span>
        <input type="text" class="form-control" id="basic-url" value="1.3 kg" aria-describedby="basic-addon3">
      </div>

      <div class="input-group mb-3">
        <table>
          <tr>
            <p style="color:#FFFFFF">Uso........</p></tr>
          <tr><td>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault1">
              <label class="form-check-label" for="flexRadioDefault1" style="color:#FFFFFF">
                Sí
              </label>
            </div>
          </td>
          </tr>
          <tr><td>
            <div class="form-check">
              <input class="form-check-input" type="radio" name="flexRadioDefault" id="flexRadioDefault2" checked>
              <label class="form-check-label" for="flexRadioDefault2" style="color:#FFFFFF">
                No
              </label>
            </div></td>
          </tr>
        </table>
      </div>


    </div>


  </div>



  <hr class="featurette-divider">
  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <a href="CatalogoObjetos.html"><button type="button" class="btn btn-danger">Aceptar >></button></a>
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

</body>

</html>


