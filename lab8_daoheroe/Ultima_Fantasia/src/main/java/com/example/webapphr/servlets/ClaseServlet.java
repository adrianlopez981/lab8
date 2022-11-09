package com.example.webapphr.servlets;

import com.example.webapphr.model.daos.DaoClases;
import com.example.webapphr.model.beans.Clases;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "CatalogoServlet", value = "/CatalogoServlet")
public class ClaseServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action")==null ? "listar":request.getParameter("action");
        RequestDispatcher requestDispatcher;
        DaoClases daoClases = new DaoClases();
        switch (action){
            case "listar":
                ArrayList<Clases> listaClasesSer = null;
                listaClasesSer = daoClases.listaClases();
                request.setAttribute("listarClases", listaClasesSer);
                requestDispatcher = request.getRequestDispatcher("clasesEnemigos.jsp");
                requestDispatcher.forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}