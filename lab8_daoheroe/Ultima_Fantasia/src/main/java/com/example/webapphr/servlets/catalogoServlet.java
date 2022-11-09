package com.example.webapphr.servlets;

import com.example.webapphr.model.beans.CatalogoObjetos;
import com.example.webapphr.model.daos.DaoCatalogoObjetos;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(name = "CatalogoServlet", value = "/CatalogoServlet")
public class catalogoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action")==null ? "listar":request.getParameter("action");
        RequestDispatcher requestDispatcher;
        DaoCatalogoObjetos catalogoObjetos = new DaoCatalogoObjetos();

        switch (action){
            case "editar":
                String id= request.getParameter("id");
                int objetos = Integer.parseInt(id);
                ArrayList<CatalogoObjetos> cataObjetos = catalogoObjetos.listaCatalogoObjetos();
                if(cataObjetos == null){
                    response.sendRedirect(request.getContextPath() + "/CatalogoServlet");
                }else{
                    request.setAttribute("editar",cataObjetos);
                    requestDispatcher = request.getRequestDispatcher("EditarCatalogoNo.jsp");
                    requestDispatcher = request.getRequestDispatcher("EditarCatalogoSi.jsp");
                    requestDispatcher.forward(request, response);
                }
                break;

            case"Borrar":
                String borrar = request.getParameter("ID");
                try{
                    int borrar1 = Integer.parseInt(borrar);
                    catalogoObjetos.borrar(String.valueOf(borrar1));
                    response.sendRedirect(request.getContextPath() + "/CatalogoServlet");
                }catch (NumberFormatException e){
                    response.sendRedirect(request.getContextPath()+"/CatalogoServlet");
                }
                break;

            case"Añadir":
                requestDispatcher = request.getRequestDispatcher("AnadirCatalogo.jsp");
                requestDispatcher.forward(request, response);

            case "Listar":
                ArrayList<CatalogoObjetos> listaCatalogoOb = null;
                listaCatalogoOb = catalogoObjetos.listaCatalogoObjetos();
                request.setAttribute("listaCatalogoObjetos", listaCatalogoOb);
                requestDispatcher = request.getRequestDispatcher("CatalogoObjetos.jsp");
                requestDispatcher.forward(request,response);
            break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        DaoCatalogoObjetos daoCatalogoObjetos = new DaoCatalogoObjetos();
        RequestDispatcher requestDispatcher;
        String id_cataOb = request.getParameter("ID");
        int id_cat =Integer.parseInt(id_cataOb);
        String cataPeso = request.getParameter("CatalogoObjeto");
        String cataEfecto = request.getParameter("EfectoCatalogoObjeto");
        switch (action){
            case "añadir":
                String nombre = request.getParameter("nombreObjeto");
                String efecto = request.getParameter("efecto/usoObjeto");
                String pesoObjeto = request.getParameter("pesoObjeto");
                boolean usoHeroe = false;
                int nombreSer=0;
                int repetido = 0;
                int efectoSer = 0;
                int pesoSer = 0;
                float pesos = 0;

                if(nombre!=null){
                    if(repetido == 0){
                        nombreSer = 1;
                    }else {
                        nombreSer = 0;
                        request.getSession().setAttribute("Nombre Catalogo","objeto ya en base");
                    }
                }else{
                    nombreSer=2;
                    request.getSession().setAttribute("informe peso", "llenar obligatoriamente");
                }

                if(efecto!=null){

                }else {

                }
                if(pesoObjeto!=null){
                    try{
                            pesos = Float.parseFloat(pesoObjeto);
                            id_cat = 4;
                        }catch(NumberFormatException e){
                        id_cat = 2;
                        request.getSession().setAttribute("Informe", "Ingresar peso adecuado");
                    }
                    if(id_cat==4){
                        if(pesos>0){
                            id_cat = 1;
                        }else{
                            id_cat = 0;
                            request.getSession().setAttribute("Informe","Ingresar peso correcto");
                        }
                    }
                }else{
                    id_cat = 3;
                    request.getSession().setAttribute("Informe","Llenar");
                }
                if(nombreSer == 1 && efectoSer==1 && pesoSer==1){
                    daoCatalogoObjetos.agregarCataObjeto(nombre,efecto, pesoSer,usoHeroe);
                    response.sendRedirect(request.getContextPath() + "/CatalogoServlet?");
                }else{
                    request.getSession().setAttribute("infotodo","Campos llenados erroneamente");
                    response.sendRedirect(request.getContextPath()+"/CatalogoServlet?accion=addd");
                }
                break;

            case "editar":
                String id_catalogo = request.getParameter("id_parameter");
                int id_cataObjeto = Integer.parseInt(id_catalogo);
                String cata_peso = request.getParameter("pesoObjeto");
                String cata_efcto = request.getParameter("efecto/usoObjeto");
                Float cata_efc = Float.parseFloat(cataEfecto);

                if(cata_peso == null){
                    try {
                        daoCatalogoObjetos.Si_editarCatalogoObjetos(cata_efc,id_cataObjeto);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }else{
                    float pesso = Float.parseFloat(cata_peso);
                    try {
                        daoCatalogoObjetos.No_editarCatalogoObjetos(cata_efc, pesso, id_cataObjeto);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                }
                response.sendRedirect(request.getContextPath()+"/CatalogoServlet");
                break;


        }

    }
}
