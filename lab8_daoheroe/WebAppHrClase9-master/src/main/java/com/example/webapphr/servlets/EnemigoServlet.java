package com.example.webapphr.servlets;

import com.example.webapphr.model.beans.Hechizos;
import com.example.webapphr.model.daos.DaoHechizo;
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
        DaoHechizo daoHechizo= new DaoHechizo();
        String HechizoId;
        Hechizos hechizos;

        switch (action) {
            case "listar":
                request.setAttribute("lista", daoHechizo.lista());

                requestDispatcher = request.getRequestDispatcher("jobs/lista.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "crear":
                requestDispatcher = request.getRequestDispatcher("jobs/formCrear.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "editar":
                HechizoId = request.getParameter("idHechizo");
                hechizos = daoHechizo.buscarPorId(HechizoId);

                if (hechizos != null) { //abro el form para editar
                    request.setAttribute("hechizos", hechizos);
                    requestDispatcher = request.getRequestDispatcher("jobs/formEditar.jsp");
                    requestDispatcher.forward(request, response);
                } else { //id no encontrado
                    response.sendRedirect(request.getContextPath() + "/HechizoServlet");
                }
                break;
            case "borrar":  // JobServlet?action=borrar&id=50
                HechizoId = request.getParameter("idHeroe");
                daoHechizo.borrar(HechizoId);

                response.sendRedirect(request.getContextPath() + "/HeroeServlet");
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        DaoHechizo daoHechizo = new DaoHechizo();

        switch (action) {
            case "guardar":
                String idheroeStr = request.getParameter("idHeroe");
                int idheroe = Integer.parseInt(idheroeStr);
                String nombreHeroe = request.getParameter("nombreHeroe");
                String edadStr = request.getParameter("edadHeroe");
                int edadHeroe = Integer.parseInt(edadStr); //esto deben validar
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

                Hechizos hechizos = new Hechizos();
                hechizos.setIdHechizo(idHechizos);
                hechizos.setNombre(nombreHeroe);
                hechizos.setEdad(edadHeroe);
                hechizos.setIdGenero(idGenero);
                hechizos.setClaseHeroeId(claseHeroe);
                hechizos.setNivelHeroeId(NivelHeroe);
                hechizos.setAtaqueHeroe(ataqueHeroe);
                hechizos.setIdPareja(idpareja);
                DaoHechizo.guardar(hechizos);



                response.sendRedirect(request.getContextPath() + "/HechizoServlet");
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


                    daoHechizo.actualizar(nombreHeroe1,edadHeroe1,generoIdHeroe1,claseIdHeroe1,nivelHeroe1,idHeroe1,Ataque1,idPareja1);

                    response.sendRedirect(request.getContextPath() + "/HechizoServlet");
                } catch (NumberFormatException e) {
                    response.sendRedirect(request.getContextPath() + "/HechizoServlet?action=editar&id=" );
                }
                break;

    }
}
