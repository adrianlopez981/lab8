package com.example.webapphr.model.daos;

import com.example.webapphr.model.beans.Enemigo;

import java.sql.*;
import java.util.ArrayList;

public class DaoEnemigo {

        public ArrayList<Enemigo> listaEnemigo() {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            ArrayList<Enemigo> lista = new ArrayList<>();

            String sql = "select  e.nombreEnemigo, c.Clasificacion, ListaAtaquesEnemigo_idListaAtaquesEnemigo, ExperienciaXDerrotaEnemigo_idExperienciaXDerrotaEnemigo," +
                    "o.nombreObjeto, " +
                    "p.numeroProbabilidad, g.nombre, e.idEnemigo, c.idClasificacionAtaqueEnemigo, o.idObjeto" +
                    " from enemigo e, clasificacionataqueenemigo c, objeto o , genero g, probabilidadobjeto p";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(sql)) {

                while (rs.next()) {
                    Enemigo enemigo = new Enemigo();
                    enemigo.setEnemigoId(rs.getInt(1));
                    enemigo.setNombreEnemigo(rs.getString(2));
                    enemigo.setClase(rs.getString(3));
                    enemigo.setAtaqueEnemigo(rs.getInt(4));
                    enemigo.setExperienciaEnemigo(rs.getInt(5));
                    enemigo.setObjeto(rs.getString(6));
                    enemigo.setGenero(rs.getString(7));
                    lista.add(enemigo);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return lista;
        }

        public boolean editarEnemigo(Enemigo enemigo){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String user = "root";
            String pasw = "root";
            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql = "update enemigo set nombreEnemigo = ?, c.idClasificacionAtaqueEnemigo = ?, c.clasificacion = ?, ExperienciaXDerrotaEnemigo_idExperienciaXDerrotaEnemigo = ?, o.idObjeto = ?, Genero_idGenero = ? where idEnemigo = ?" +
                    " from clasificacionataqueenemigo c, objeto o ";


            try(Connection conn = DriverManager.getConnection(url, user, pasw);
                PreparedStatement pstmt = conn.prepareStatement(sql)) {

                pstmt.setString(1, enemigo.getNombreEnemigo());
                pstmt.setInt(2,enemigo.getClaseEnemigoId());
                pstmt.setInt(3, enemigo.getAtaqueEnemigo());
                pstmt.setInt(4,enemigo.getExperienciaEnemigo());
                pstmt.setInt(5,enemigo.getIdObjeto());
                pstmt.setFloat(6,enemigo.getProbabilidad());
                pstmt.setString(7,enemigo.getGenero());
                pstmt.setInt(8,enemigo.getEnemigoId());

                pstmt.executeUpdate();
                return true;
            }
            catch (SQLException e){
                return false;
            }
        }

        public void borrar(String enemigoId) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql = "DELETE FROM enemigo WHERE idEnemigo = ?";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setString(1, enemigoId);
                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        public Enemigo buscarEnemigoPorId(String enemigoId) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";

            Enemigo enemigo = null;

            String sql = "select * from enemigo where idEnemigo=?";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql);) {

                pstmt.setString(1, enemigoId);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        enemigo = new Enemigo();
                        enemigo.setEnemigoId(rs.getInt(1));
                        enemigo.setNombreEnemigo(rs.getString(2));
                        enemigo.setClase(rs.getString(3));
                        enemigo.setAtaqueEnemigo(rs.getInt(4));
                        enemigo.setExperienciaEnemigo(rs.getInt(5));
                        enemigo.setObjeto(rs.getString(6));
                        enemigo.setGenero(rs.getString(7));

                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return enemigo;

        }

        public static void guardarEnemigo(Enemigo enemigo){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql = "insert into enemigo (nombreEnemigo,c.idClaseHeroe,ListaAtaquesEnemigo_idListaAtaquesEnemigo,ExperienciaXDerrotaEnemigo_idExperienciaXDerrotaEnemigo,o.nombreObjeto,p.numeroProbabilidad, g.nombre ) VALUES (?,?,?,?,?,?,?)"
                    + " from clasificacionataqueenemigo c, objeto o, p.probabilidadobjeto ,g.genero";


            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setString(1, enemigo.getNombreEnemigo());
                pstmt.setInt(2, enemigo.getEdadEnemigo());
                pstmt.setString(3, enemigo.getGenero());
                pstmt.setString(4, enemigo.getClase());
                pstmt.setInt(5, enemigo.getExperienciaEnemigo());
                pstmt.setString(6, enemigo.getObjeto());


                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        public void actualizar (String nombreEnemigo,int edadEnemigo, String genero, int claseEnemigo, int experienciaEnemigo,
                                String objeto){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql = "update enemigo set nombreEnemigo, ListaAtaquesEnemigo_idListaAtaquesEnemigo, Genero_idGenero,ExperienciaXDerrotaEnemigo_idExperienciaXDerrotaEnemigo,o.nombreObjeto,p.numeroProbabilidad, g.nombre, c.idClaseHeroe "
                    + "from clasificacionataqueenemigo c, objeto o, p.probabilidadobjeto ,g.genero";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setString(1, nombreEnemigo);
                pstmt.setInt(2, edadEnemigo);
                pstmt.setString(3, genero);
                pstmt.setInt(4, claseEnemigo);
                pstmt.setInt(5, experienciaEnemigo);
                pstmt.setString(6, objeto);

                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
}
