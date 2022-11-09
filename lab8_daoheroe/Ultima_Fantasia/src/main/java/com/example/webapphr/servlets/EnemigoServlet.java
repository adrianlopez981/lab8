package com.example.webapphr.servlets;

import com.example.webapphr.model.beans.Enemigo;
import com.example.webapphr.model.daos.DaoEnemigo;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "EnemigoServlet", value = "/EnemigoServlet")
public class EnemigoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (action == null) ? "listar" : action;
        RequestDispatcher requestDispatcher;
        DaoEnemigo daoEnemigo= new DaoEnemigo();
        String EnemigoId;
        Enemigo enemigo;

        switch (action) {
            case "listar":
                request.setAttribute("lista", daoEnemigo.listaEnemigo());

                requestDispatcher = request.getRequestDispatcher("jobs/lista.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "crear":
                requestDispatcher = request.getRequestDispatcher("jobs/formCrear.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "editar":
                EnemigoId = request.getParameter("idEnemigo");
                enemigo = daoEnemigo.buscarPorId(EnemigoId);

                if (enemigo != null) { //abro el form para editar
                    request.setAttribute("enemigo", enemigo);
                    requestDispatcher = request.getRequestDispatcher("jobs/formEditar.jsp");
                    requestDispatcher.forward(request, response);
                } else { //id no encontrado
                    response.sendRedirect(request.getContextPath() + "/EnemigoServlet");
                }
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

                int edadEnemigo = Integer.parseInt(edadEnemigoStr); //esto deben validar

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
            case "actualizar":

                String idenemigoStr2 = request.getParameter("idEnemigo");

                String nombreHeroe1 = request.getParameter("nombreHeroe");
                String edadStr2 = request.getParameter("edadHeroe");
                String idgeneroStr2 = request.getParameter("genero_idgenero");
                String claseheroeidStr2 = request.getParameter("ClaseHeroe_idClaseHeroe");
                String NivelHeroeStr2 = request.getParameter("NivelHeroe_idNivelHeroe");
                String ataqueStr2 = request.getParameter("ataque");
                String idparejaStr2 = request.getParameter("pareja_idpareja");

                try {

                    int idHeroe1 = Integer.parseInt(idenemigoStr2);

                    int edadHeroe1 = Integer.parseInt(edadStr2); //esto deben validar
                    int generoIdEnemigo1 = Integer.parseInt(idgeneroStr2);
                   /* int claseIdHeroe1 = Integer.parseInt(claseheroeidStr2);
                    int nivelHeroe1 = Integer.parseInt(NivelHeroeStr2);
                    int Ataque1 = Integer.parseInt(ataqueStr2);
                    int idPareja1 = Integer.parseInt(idparejaStr2);*/


                    daoEnemigo.actualizar(nombreHeroe1,edadHeroe1,idHeroe1);

                    response.sendRedirect(request.getContextPath() + "/HechizoServlet");
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/HechizoServlet?action=editar&id=" );
                }
                break;

    }
}
