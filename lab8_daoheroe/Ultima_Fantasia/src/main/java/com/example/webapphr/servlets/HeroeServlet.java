package com.example.webapphr.servlets;

import com.example.webapphr.model.beans.Heroe;
import com.example.webapphr.model.daos.DaoHeroe;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HeroeServlet", value = {"/HeroeServlet","/Heroes"})
public class HeroeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        action = (action == null) ? "listar" : action;
        RequestDispatcher requestDispatcher;

        DaoHeroe daoHeroe = new DaoHeroe();
        ArrayList<Heroe> listaHeroesSer = daoHeroe.lista();

        String HeroeId;
        Heroe heroe;

        switch (action) {
            case "listar":
                request.setAttribute("lista", listaHeroesSer);

                requestDispatcher = request.getRequestDispatcher("MenuHeroes.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "crear":
                requestDispatcher = request.getRequestDispatcher("AnadirHeroe.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "editar":
                HeroeId = request.getParameter("idHeroe");
                heroe = daoHeroe.buscarPorId(HeroeId);

                if (heroe != null) {
                    request.setAttribute("heroe", heroe);
                    requestDispatcher = request.getRequestDispatcher("jobs/formEditar.jsp");
                    requestDispatcher.forward(request, response);
                } else {
                    response.sendRedirect(request.getContextPath() + "/HeroeServlet");
                }
                break;
            case "borrar":  // JobServlet?action=borrar&id=50
                HeroeId = request.getParameter("idHeroe");
                daoHeroe.borrar(HeroeId);

                response.sendRedirect(request.getContextPath() + "/HeroeServlet");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");

        DaoHeroe daoHeroe = new DaoHeroe();

        switch (action) {
            case "guardar":
                String idheroeStr = request.getParameter("idHeroe");
                int idheroe = Integer.parseInt(idheroeStr);
                String nombreHeroe = request.getParameter("nombreHeroe");
                String edadStr = request.getParameter("edadHeroe");
                int edadHeroe = Integer.parseInt(edadStr);
                String idgeneroStr = request.getParameter("genero_idgenero");
                int idGenero = Integer.parseInt(idgeneroStr);
                String claseheroeidStr = request.getParameter("ClaseHeroe_idClaseHeroe");
                int claseHeroe = Integer.parseInt(claseheroeidStr);
                String NivelHeroeStr = request.getParameter("NivelHeroe_idNivelHeroe");
                int NivelHeroe = Integer.parseInt(NivelHeroeStr);
                String ataqueStr = request.getParameter("ataque");
                int ataqueHeroe = Integer.parseInt(ataqueStr);
                String idparejaStr = request.getParameter("pareja_idpareja");
                int idpareja = Integer.parseInt(idparejaStr);
                try{
                    Heroe heroe = new Heroe();
                    heroe.setHeroeId(idheroe);
                    heroe.setNombre(nombreHeroe);
                    heroe.setEdad(edadHeroe);
                    heroe.setIdGenero(idGenero);
                    heroe.setClaseHeroeId(claseHeroe);
                    heroe.setNivelHeroeId(NivelHeroe);
                    heroe.setAtaqueHeroe(ataqueHeroe);
                    heroe.setIdPareja(idpareja);
                    DaoHeroe.guardar(heroe);
                    response.sendRedirect(request.getContextPath() + "/HeroeServlet");
                }
                catch (NumberFormatException e){
                    response.senRedirect(request.getContextPath() + "/HeroeServlet?id=newHero");
                }

                break;
            case "actualizar":

                String idheroeStr2 = request.getParameter("idHeroe");
                String nombreHeroe1 = request.getParameter("nombreHeroe");
                String edadStr2 = request.getParameter("edadHeroe");
                String idgeneroStr2 = request.getParameter("genero_idgenero");
                String claseheroeidStr2 = request.getParameter("ClaseHeroe_idClaseHeroe");
                String NivelHeroeStr2 = request.getParameter("NivelHeroe_idNivelHeroe");
                String ataqueStr2 = request.getParameter("ataque");
                String idparejaStr2 = request.getParameter("pareja_idpareja");

                try {

                    int idHeroe1 = Integer.parseInt(idheroeStr2);
                    int edadHeroe1 = Integer.parseInt(edadStr2); //esto deben validar
                    int generoIdHeroe1 = Integer.parseInt(idgeneroStr2);
                    int claseIdHeroe1 = Integer.parseInt(claseheroeidStr2);
                    int nivelHeroe1 = Integer.parseInt(NivelHeroeStr2);
                    int Ataque1 = Integer.parseInt(ataqueStr2);
                    int idPareja1 = Integer.parseInt(idparejaStr2);


                    daoHeroe.actualizar(nombreHeroe1,edadHeroe1,generoIdHeroe1,claseIdHeroe1,nivelHeroe1,idHeroe1,Ataque1,idPareja1);

                    response.sendRedirect(request.getContextPath() + "/HeroeServlet");
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/HeroeServlet?action=editar&id="+idheroeStr2);
                }
                break;
        }
    }
}
