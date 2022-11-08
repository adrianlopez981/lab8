<%--
  Created by IntelliJ IDEA.
  User: Anais
  Date: 5/11/2022
  Time: 18:12
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
        <li><a href="<%=request.getContextPath()%>/MenuPrincipal" class="nav-link px-2"><b style="color:#CDEFB4">Menú Principal</b></a></li>
        <li><a href="<%=request.getContextPath()%>/MenuHeroes" class="nav-link px-2 text-white">Menú Héroes</a></li>
        <li><a href="<%=request.getContextPath()%>/MenuEnemigos" class="nav-link px-2 text-white">Menú Enemigos</a></li>
        <li><a href="<%=request.getContextPath()%>/MenuHechizos" class="nav-link px-2 text-white">Menú Hechizos</a></li>
        <li><a href="<%=request.getContextPath()%>/CatalogoObjetos" class="nav-link px-2 text-white">Catálogo Objetos</a></li>
      </ul>

      <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
        <table>
          <tr>
            <td><input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Buscar..." aria-label="Search"></td>
            <td></td>
            <td></td>
            <td></td>
            <td></td>
            <td><a href="<%=request.getContextPath()%>/Inicio" style="color:#ECE987"><b>SALIR ></b></a></td>
        </table>
    </div>
  </div>
</header>
<br>


<div class="container marketing">

  <!-- START THE FEATURETTES -->

  <hr class="featurette-divider">

  <div class="row featurette" style="background-color:#09180380">
    <div class="col-md-7">
      <p></p>
      <center><h1 style="font-weight: 400;font-style: normal; color:#DCB5E5" class="custom-font" class="card-subtitle">H e c h i z o</h1></center>
      <center><p class="card-text" style="font-weight: 400;font-style: normal; color:#DCB5E5"><small>Añadir</small></p></center>
      <p>
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Nombre :</span>
        <input type="text" class="form-control" placeholder="Ingrese Nombre" aria-label="Username" aria-describedby="basic-addon1">
      </div>

      <div class="input-group mb-3">

        <span class="input-group-text" id="basic-addon2">Elemento</span>
        <select class="form-select" aria-label="Default select example">
          <option selected>Elemento</option>
          <option value="1">Fuego</option>
          <option value="2">Tierra</option>
          <option value="3">Agua</option>
          <option value="3">Viento</option>
          <option value="3">Void</option>
        </select>
      </div>

      <div class="input-group mb-3">
        <span class="input-group-text">Potencia :</span>
        <input type="text" class="form-control" placeholder="Ingrese potencia" aria-label="Username">
        <span class="input-group-text">Precisión :</span>
        <input type="text" class="form-control" placeholder="Ingrese número de precisión" aria-label="Server">
      </div>

      <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Id Hechizo Base" aria-label="Recipient's username" aria-describedby="basic-addon2">
        <span class="input-group-text" id="basic-addon2">: Hechizo base</span>
      </div>
      <div class="input-group mb-3">
        <span class="input-group-text" id="basic-addon1">Nivel de aprendizaje :</span>
        <input type="text" class="form-control" placeholder="Ingrese nivel" aria-label="Username" aria-describedby="basic-addon1">
      </div>
    </div>
    <div class="col-md-5">
      <p></p>
      <br>
      <br>
      <img class="bd-placeholder-img bd-placeholder-img-lg featurette-image img-fluid mx-auto" width="600" height="500" src="1x/hechizo.jpg"><rect width="100%" height="100%" src="1x/diosInti.png"></rect>
      <center><p class="card-text" style="font-weight: 400;font-style: normal; color:#DCB5E5"><small>Foto referencial de las épicas batallas</small></p></center>
    </div>

  </div>



  <hr class="featurette-divider">
  <div class="d-grid gap-2 d-md-flex justify-content-md-end">
    <a href="<%=request.getContextPath()%>/MenuHechizos"><button type="button" class="btn btn-danger">Aceptar >></button></a>
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


