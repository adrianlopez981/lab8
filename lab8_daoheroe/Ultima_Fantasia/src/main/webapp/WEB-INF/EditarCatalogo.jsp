<%--
  Created by IntelliJ IDEA.
  User: Anais
  Date: 5/11/2022
  Time: 18:08
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
        <li><a href="<%=request.getContextPath()%>/MenuPrincipal" class="nav-link px-2"><b style="color:#CDEFB4">Men?? Principal</b></a></li>
        <li><a href="<%=request.getContextPath()%>/MenuHeroes" class="nav-link px-2 text-white">Men?? H??roes</a></li>
        <li><a href="<%=request.getContextPath()%>/MenuEnemigos" class="nav-link px-2 text-white">Men?? Enemigos</a></li>
        <li><a href="<%=request.getContextPath()%>/MenuHechizos" class="nav-link px-2 text-white">Men?? Hechizos</a></li>
        <li><a href="<%=request.getContextPath()%>/CatalogoObjetos" class="nav-link px-2 text-white">Cat??logo Objetos</a></li>
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
<center>
  <div class="card" style="width: 21rem;">
    <div class="card-body">
      <h4 class="card-title" style="color:#CBA11E"><b>EDITAR OBJETO</h4></b>
      <h6 class="card-subtitle mb-2 text-muted">Cat??logo Objetos </h6>
      <p class="card-text">Antes de continuar, responda la siguiente pregunta, ??el objeto est?? siendo usado por alg??n h??roe?</p>
      <div class="btn-group" role="group" aria-label="Basic outlined example">
        <a href="<%=request.getContextPath()%>/EditarCatalogoSi" class="card-link"><button type="button" class="btn btn-outline-success">S??</button></a>
        <a href="<%=request.getContextPath()%>/EditarCatalogoNo" class="card-link"><button type="button" class="btn btn-outline-success">No</button></a>
      </div>
    </div>
  </div>



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


