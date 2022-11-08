package com.example.webapphr.model.daos;

import com.example.webapphr.model.beans.Hechizos;

import java.sql.*;
import java.util.ArrayList;

public class DaoHechizo {

        public ArrayList<Hechizos> listaHechizo() {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            ArrayList<Hechizos> listaHechizo = new ArrayList<>();

            String sql = "select * from magia";
            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(sql);) {

                while (rs.next()) {
                    Hechizos hechizos = new Hechizos();
                    hechizos.setIdHechizo(rs.getInt(1));
                    hechizos.setNombreHechizo(rs.getString(2));
                    hechizos.setElemento(rs.getString(3));
                    hechizos.setPotencia(rs.getFloat(4));
                    hechizos.setPrecision(rs.getFloat(5));
                    hechizos.setHechizobase(rs.getString(6));
                    hechizos.setNivelAprendizaje(rs.getFloat(7));

                    listaHechizo.add(hechizos);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return listaHechizo;
        }


        public void borrar(String HeroeId) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql = "DELETE FROM objeto WHERE idMagia = ?";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setString(1, HeroeId);
                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        public void actualizar (String nombreHechizo,int hechizoId, String elementoHechizo , int potenciaHechizo, int precisionHechizo,
                                String hechizoBase, int nivelAprendizajeHechizo){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            /*cambiar los insert into por updates */
            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql =
                    "UPDATE magia SET idMagia=?,hexaHechizoId=?,nombreHechizo=?,potenciaHechizo=?, precisionHechizo=?,Elemento_idElemento=?,ProbabilidadObjeto_idProbabilidadObjeto=?, exclusividad=? WHERE idHeroe=?";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setString(1, nombreHechizo);
                pstmt.setString(2, elementoHechizo);
                pstmt.setInt(3, potenciaHechizo);
                pstmt.setInt(4, precisionHechizo);
                pstmt.setString(5, hechizoBase);
                pstmt.setInt(6, nivelAprendizajeHechizo);


                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    public static void guardarHechizo(Hechizos hechizos) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/grupored";
        String sql = "INSERT INTO heroe (nombreHechizo,Elemento_idElemento,potenciaHechizo, precisionHechizo, hexaHechizoId,ProbabilidadObjeto_idProbabilidadObjeto,exclusividad) VALUES (?,?,?,?,?,?,?)";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1,hechizos.getNombreHechizo());
            pstmt.setString(2, hechizos.getElemento());
            pstmt.setFloat(3,hechizos.getPotencia());
            pstmt.setFloat(4,hechizos.getPrecision());
            pstmt.setString(5,hechizos.getHechizobase());
            pstmt.setFloat(6,hechizos.getNivelAprendizaje());


            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
