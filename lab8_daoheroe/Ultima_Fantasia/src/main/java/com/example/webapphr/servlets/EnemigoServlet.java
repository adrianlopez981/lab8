package com.example.webapphr.servlets;

import com.example.webapphr.model.beans.Enemigo;
import com.example.webapphr.model.daos.DaoEnemigo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import com.example.webapphr.model.beans.Clases;
import com.example.webapphr.model.daos.DaoClases;
import com.example.webapphr.model.beans.CatalogoObjetos;
import com.example.webapphr.model.daos.DaoCatalogoObjetos;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "EnemigoServlet", value = "/EnemigoServlet")
public class EnemigoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ID = request.getParameter("ID");
        ID = (ID == null) ? "ID_" : ID;
        RequestDispatcher requestDispatcher;
        DaoEnemigo daoEnemigo= new DaoEnemigo();
        String EnemigoId;
        Enemigo enemigo;
        ArrayList<Enemigo> listaEnemigoSer = daoEnemigo.listaEnemigo();
        DaoClases daoClases = new DaoClases();
        ArrayList<Clases> listaClasesSer = daoClases.listaClases();
        DaoCatalogoObjetos daoCatalogoObjetos = new DaoCatalogoObjetos();
        ArrayList<CatalogoObjetos> listaCatalogoObjetos = daoCatalogoObjetos.listaCatalogoObjetos();

        switch (ID) {
            case "ID_":
                request.setAttribute("ID_", listaEnemigoSer);
                requestDispatcher = request.getRequestDispatcher("MenuEnemigos.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "AnadirEnemigo":
                requestDispatcher = request.getRequestDispatcher("AnadirEnemigo.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "Editar Enemigo":
                EnemigoId = request.getParameter("EditarEnemigo");
                enemigo = daoEnemigo.buscarEnemigoPorId(EnemigoId);

                if (enemigo != null) { //abro el form para editar
                    request.setAttribute("enemigo", enemigo);
                    request.setAttribute("ListaEnemigo", listaEnemigoSer);
                    request.setAttribute("ListaClases", listaClasesSer);
                    request.setAttribute("ListaObjetos", listaCatalogoObjetos);

                    requestDispatcher = request.getRequestDispatcher("EditarEnemigo.jsp");
                    requestDispatcher.forward(request, response);
                } else { //id no encontrado
                    response.sendRedirect(request.getContextPath() + "/EnemigoServlet");
                }
                break;

            case "Clase":
                requestDispatcher = request.getRequestDispatcher("clasesEnemigos.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "borrar":  // JobServlet?action=borrar&id=50
                EnemigoId = request.getParameter("idEnemigo");
                daoEnemigo.borrar(EnemigoId);
                response.sendRedirect(request.getContextPath() + "/EnemigoServlet");
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        DaoEnemigo daoEnemigo = new DaoEnemigo();

        switch (action) {
            case "guardar":
                String idenemigoStr = request.getParameter("idEnemigo");
                int enemigoId = Integer.parseInt(idenemigoStr);

                String nombreEnemigo = request.getParameter("nombreEnemigo");
                String edadEnemigoStr = request.getParameter("edadEnemigo");

                int edadEnemigo = Integer.parseInt(edadEnemigoStr);

                String idgeneroStr = request.getParameter("genero_idgenero");
                int idGenero = Integer.parseInt(idgeneroStr);

                String experienciaEnemigoidStr = request.getParameter("Experiencia_idExperienciaEnemigo");
                int experienciaEnemigo = Integer.parseInt(experienciaEnemigoidStr);

                String objetoStr = request.getParameter("Objeto Enemigo");

                String probabilidadStr = request.getParameter("Probabilidad");
                int probabilidad = Integer.parseInt(probabilidadStr);

                String IdclaseEnemigoStr = request.getParameter("clase Enemigo_id");
                int claseEnemigoId = Integer.parseInt(IdclaseEnemigoStr);

                String claseStr = request.getParameter("clase");

                String idataqueEnemigoStr = request.getParameter("ataque Enemigo");
                int idataqueEnemigo = Integer.parseInt(idataqueEnemigoStr);

                Enemigo enemigo = new Enemigo();
                enemigo.setEnemigoId(enemigoId);
                enemigo.setNombreEnemigo(nombreEnemigo);
                enemigo.setEdadEnemigo(edadEnemigo);
                enemigo.setIdGenero(idGenero);

                enemigo.setExperienciaEnemigo(experienciaEnemigo);
                enemigo.setObjeto(objetoStr);
                enemigo.setProbabilidad(probabilidad);
                enemigo.setClaseEnemigoId(claseEnemigoId);
                enemigo.setClase(claseStr);
                enemigo.setAtaqueEnemigo(idataqueEnemigo);

                DaoEnemigo.guardarEnemigo(enemigo);

                response.sendRedirect(request.getContextPath() + "/EnemigoServlet");
                break;

            case "Editar":
                enemigo = new Enemigo();
                enemigo.setEnemigoId(Integer.parseInt(request.getParameter("idEnemigo")));
                enemigo.setNombreEnemigo(request.getParameter("nombreEnemigo"));
                enemigo.setExperienciaEnemigo(Integer.parseInt(request.getParameter("ExperienciaXDerrotaEnemigo_idExperienciaXDerrotaEnemigo")));
                enemigo.setProbabilidad(Float.parseFloat(request.getParameter("numeroProbabilidad")));
                enemigo.setClaseEnemigoId(Integer.parseInt(request.getParameter("Clasificacion")));
                enemigo.setIdObjeto(Integer.parseInt(request.getParameter("idObjeto")));
                enemigo.setAtaqueEnemigo(Integer.parseInt(request.getParameter("ListaAtaquesEnemigo_idListaAtaquesEnemigo")));
                enemigo.setIdGenero(Integer.parseInt(request.getParameter("Genero_idGenerpo")));
                enemigo.setGenero(request.getParameter("nombre"));
                if (daoEnemigo.editarEnemigo(enemigo)) {
                    response.sendRedirect(request.getContextPath() + "/EditarEnemigos");
                } else {
                    response.sendRedirect(request.getContextPath() + "/EditarEnemigos?id=Editar&enemigo=" + request.getParameter("idEnemigo"));
                }
                break;
        }
    }
}
