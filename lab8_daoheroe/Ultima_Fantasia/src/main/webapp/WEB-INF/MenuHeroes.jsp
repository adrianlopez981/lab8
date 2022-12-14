<%--
  Created by IntelliJ IDEA.
  User: Anais
  Date: 5/11/2022
  Time: 18:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.webapphr.model.beans.Heroe" %>
<%@ page import="java.util.ArrayList" %>

<%
  ArrayList<Heroe> listaHeroes = (ArrayList <Heroe>) request.getAttribute("lista");
%>

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
<br>
<center>
  <div class="d-flex justify-content-center">
    <div class="card">
      <div class="card-body" style="background-color:#F2FDE8">
        <div class="p-7 mb-2 bg-primary text-white">
          <h4 style="text-align: center; color: white; font-family:'Times New Roman', Times, serif; background-color:#6B9D3D" >REPORTE  DE  H??ROES</h4>
        </div>
        <br>


        <center>
          <table class="table">

            <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Nombre</th>
              <th scope="col">Genero</th>
              <th scope="col">Clase</th>
              <th scope="col">Nivel Inicial</th>
              <th scope="col">Ataque</th>
              <th scope="col">Nombre Pareja</th>
              <th scope="col">Experiencia Inicial</th>
              <th scope="col"></th>
            </tr>
            </thead>
            <tbody class="table-group-divider">
            <% int i = 1;
            for (Heroe heroe : listaHeroes) {%>
            <tr>
              <td scope="row"> <%=heroe.getHeroeId%>> </td>
              <td> <%=heroe.getNombre()%></td>
              <% if(heroe.getGenero().equals("M")) {%>
              <td>Masculino</td>
              <%} else if (heroe.getGenero().equals("F")){%>
              <td>Femenino</td>
              <%} else{ %>
              <td>Otro</td>
              <%}%>
              <td><%=heroe.getClase()%></td>
              <td><%=heroe.getNivelHeroeId()%></td>
              <td><%=heroe.getAtaqueHeroe()%></td>
              <% if(heroe.getParejaHeroe().getIdPareja()!=null) {%>
              <td><%=heroe.getPareja().getIdPareja()%></td>
              <%} else {%>
              <td>No tiene</td>
              <%}%>
              <td class="text-center"><%=heroe.ExperienciaHeroe()%></td>
              <td>

                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                  <a href="<%=request.getContextPath()%>/HeroeServlet?accion=editar&id=<%= heroe.getHeroeId()%>" class="btn btn-success" >Editar</a>
                  <i class="fa-solid fa-pen"></i>
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
                          ??Est??s seguro de eliminar?
                        </div>
                        <div class="modal-footer">
                          <a href="<%=request.getContextPath()%>/HeroeServlet"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                          <a href="<%=request.getContextPath()%>/HeroeServlet?accion=borrar&id=<%= heroe.getHeroeId()%>"><button type="button" class="btn btn-primary">Eliminar</button></a>
                          <i class="fa-solid fa-pen"></i></i>
                        </div>
                      </div>
                    </div>
                  </div>

                  <a href="<%=request.getContextPath()%>/Ver" class="btn btn-success .5;">Ver</a>
                  <i class="fa-solid fa-pen"></i></i>
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
              <td>1000</td>
              <td>
                <div class="btn-group" role="group" aria-label="Basic mixed styles example" style="padding-left: 3rem;">
                  <a href="Editar.html" class="btn btn-success" >Editar</a>
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
                          ??Est??s seguro de eliminar?
                        </div>
                        <div class="modal-footer">
                          <a href="<%=request.getContextPath()%>/MenuHeroes"><button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button></a>
                          <a href="<%=request.getContextPath()%>/MenuHeroes"><button type="button" class="btn btn-primary">Eliminar</button></a>
                        </div>
                      </div>
                    </div>
                  </div>

                  <a href="<%=request.getContextPath()%>/Ver" class="btn btn-success .5;">Ver</a>
                </div>
              </td>
            </tr>
            <% i ++;
            }
            %>

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



<div class="d-grid gap-2 d-md-flex justify-content-md-end">
  <a href="<%=request.getContextPath()%>/AnadirHeroe"><button type="button" class="btn btn-danger">A??adir >></button></a>
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


