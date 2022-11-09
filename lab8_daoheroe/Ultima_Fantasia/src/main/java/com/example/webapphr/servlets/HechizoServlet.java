package com.example.webapphr.servlets;

import com.example.webapphr.model.daos.DaoClases;
import com.example.webapphr.model.beans.Clases;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HechizoServlet", value = "/HechizoServlet")
public class HechizoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action")==null ? "listar":request.getParameter("action");
        RequestDispatcher requestDispatcher;
        DaoHechizo daoHechizo = new DaoHechizo();
        String Hechizo_ID;
        Hechizo hechizo;
        switch (action){
            case "listar":
                ArrayList<Clases> listaHechizoSer = null;
                listaHechizoSer = daoHechizo.listaHechizo();
                request.setAttribute("listarHechizo", listaHechizoSer);
                requestDispatcher = request.getRequestDispatcher("MenuHechizos.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "Anadir":
                requestDispatcher = request.getRequestDispacher("AnadirHechizo.jsp");
                requestDispatcher.forward(request, response);
                break;
            case "Eliminar":
                Hechizo_ID = request.getParameter("idMagia");
                daoHechizo.borrar(Hechizo_ID);
                response.sendRedirect(request.getContextPath()+ "/HechizoServlet");
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        DaoHechizo daoHechizo = new DaoHechizo();

        switch (action){
            case "guardar":
                Sting idHechizoStr = request.getParameter("idMagia");
                int hechizo_id = Integer.parseInt(idHechizoStr);

                String nombreHechizo = request.getParameter("nombreHechizo");
                String potenciaStr = request.getParameter("potenciaHechizo");
                float potenciaS = Float.parseFloat(potenciaStr);

                String precisionStr = request.getParameter("precisionHechizo");
                float precisionS = Float.parseFloat(precisionStr);

                String elementoStr = request.getParameter("Elemento_idElemento");

                String hechizoBaseStr = request.getParameter("hexaHechizoId");
                String nivelAprendizajeStr= request.getParameter("exclusividad");
                float nivelAprendizajeS = Float.parseFloat(nivelAprendizajeStr);

                Hechizo hechizo = new Hechizo();
                hechizo.setNombreHechizo(nombreHechizo);
                hechizo.setIdHechizo(hechizo_id);
                hechizo.setElemento(elementoStr);
                hechizo.setPotencia(potenciaS);
                hechizo.setPrecision(precisionS);
                hechizo.setHechizoBase(hechizoBaseStr);
                hechizo.setNivelAprendizaje(nivelAprendizajeS);

                DaoHechizo.guardarHechizo(hechizo);
                response.sendRedirect(request.getContextPath()+"/HechizoServlet");
                break;
        }

    }
}