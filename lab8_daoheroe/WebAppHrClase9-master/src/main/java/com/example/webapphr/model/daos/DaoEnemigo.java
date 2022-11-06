package com.example.webapphr.model.daos;

import com.example.webapphr.model.beans.Enemigo;

import java.sql.*;
import java.util.ArrayList;

public class DaoEnemigo {

        public ArrayList<Enemigo> lista() {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            ArrayList<Enemigo> lista = new ArrayList<>();

            /*EDITAR*/

            String sql = "select h.idheroe, h.nombreHeroe, h.edadHeroe, REPLACE(REPLACE(REPLACE(g.nombre,\"M\",\"Masculino\"),\"F\",\"Femenino\"),\"O\",\"Otros\") as nombreGenero,ch.nombreclaseheroe,h.nivelheroe_idnivelheroe as nivelInicialHeroe, eh.valorEstadistica as ataqueHeroe,h.pareja_idPareja, h.PuntosXPHeroe from bbdd_lab8.genero g, bbdd_lab8.heroe h, bbdd_lab8.claseheroe ch,bbdd_lab8.estadisticaheroe eh, bbdd_lab8.estadisticaheroe_has_heroe ehh\n" +
                    "where ch.idclaseheroe = h.claseheroe_idclaseheroe\n" +
                    "and g.idGenero = h.Genero_idGenero\n" +
                    "and eh.idEstadisticaHeroe = ehh.EstadisticaHeroe_idEstadisticaHeroe and eh.nombreEstadistica = \"ataque\"\n" +
                    "and ehh.heroe_idHeroe = h.idheroe\n" +
                    "order by idheroe asc";
            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(sql);) {

                while (rs.next()) {
                    Enemigo enemigo = new Enemigo();
                    enemigo.setEnemigoId(rs.getInt(1));
                    enemigo.setNombreEnemigo(rs.getString(2));
                    enemigo.setEdadEnemigo(rs.getInt(3));
                    enemigo.setClase(rs.getString(4));
                    enemigo.setAtaqueEnemigo(rs.getInt(5));
                    enemigo.setExperienciaEnemigo(rs.getInt(6));
                    enemigo.setObjeto(rs.getString(7));
                    enemigo.setGenero(rs.getString(8));
                    lista.add(enemigo);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return lista;
        }


        public void borrar(String enemigoId) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql = "DELETE FROM heroe WHERE idEnemigo = ?";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setString(1, enemigoId);
                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        public Enemigo buscarPorId(String enemigoId) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";

            Enemigo enemigo = null;
            /*EDITAR*/
            String sql = "select h.idheroe, h.nombreHeroe, h.edadHeroe, REPLACE(REPLACE(REPLACE(g.nombre,\"M\",\"Masculino\"),\"F\",\"Femenino\"),\"O\",\"Otros\") as nombreGenero,ch.nombreclaseheroe,h.nivelheroe_idnivelheroe as nivelInicialHeroe, eh.valorEstadistica as ataqueHeroe,h.pareja_idPareja, h.PuntosXPHeroe from bbdd_lab8.genero g, bbdd_lab8.heroe h, bbdd_lab8.claseheroe ch,bbdd_lab8.estadisticaheroe eh, bbdd_lab8.estadisticaheroe_has_heroe ehh\n" +
                    "where ch.idclaseheroe = h.claseheroe_idclaseheroe\n" +
                    "and g.idGenero = h.Genero_idGenero\n" +
                    "and eh.idEstadisticaHeroe = ehh.EstadisticaHeroe_idEstadisticaHeroe and eh.nombreEstadistica = \"ataque\"\n" +
                    "and ehh.heroe_idHeroe = h.idheroe\n" +
                    "and h.idHeroe = ? order by idheroe asc;";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql);) {

                pstmt.setString(1, enemigoId);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        enemigo = new Enemigo();
                        enemigo.setEnemigoId(rs.getInt(1));
                        enemigo.setNombreEnemigo(rs.getString(2));
                        enemigo.setEdadEnemigo(rs.getInt(3));
                        enemigo.setClase(rs.getString(4));
                        enemigo.setAtaqueEnemigo(rs.getInt(5));
                        enemigo.setExperienciaEnemigo(rs.getInt(6));
                        enemigo.setObjeto(rs.getString(7));
                        enemigo.setGenero(rs.getString(8));

                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return enemigo;

        }

        public static void guardar(Enemigo enemigo){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql = "INSERT INTO heroe (nombreHeroe, edadHeroe, Genero_generoid, ClaseHeroe_idClaseHeroe,NivelHeroe_idNivelHeroe) VALUES (?,?,?,?,?);" +
                    "INSERT INTO estadistica (nombreEstadistica, valorEstadistica) VALUES ('ataque',?);" +
                    "INSERT INTO estadistica (nombreEstadistica, valorEstadistica) VALUES ('defensa',?);" +
                    "INSERT INTO estadistica (nombreEstadistica, valorEstadistica) VALUES ('velocidad',?);" +
                    "INSERT INTO estadistica (nombreEstadistica, valorEstadistica) VALUES ('poder magico',?);" +
                    "INSERT INTO estadistica (nombreEstadistica, valorEstadistica) VALUES ('espiritu',?);" +
                    "INSERT INTO estadistica (nombreEstadistica, valorEstadistica) VALUES ('suerte',?);" +
                    "UPDATE ehh SET ehh.heroe_idheroe = h.idHeroe FROM estadisticaheroe_has_heroe ehh, heroe h WHERE h.PuntosXPHeroe is null;" +
                    "INSERT INTO pareja(idPareja) VALUES (?);" +
                    "UPDATE rp SET rp.heroe_idheroe = h.idHeroe, rp.Pareja_idPareja = p.idPareja FROM relacionpareja rp, heroe h, pareja p WHERE h.PuntosXPHeroe is null and p.Heroe_idHeroe is null;" +
                    "UPDATE pareja SET Heroe_idHeroe = idPareja WHERE Heroe_idHeroe is null;" +
                    "UPDATE h SET h.Pareja_idPareja = rp.Pareja_idPareja FROM relacionpareja rp, heroe h WHERE h.PuntosXPHeroe is null;";


            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setString(1, enemigo.getNombreEnemigo());
                pstmt.setInt(2, enemigo.getEdadEnemigo());
                pstmt.setString(3, enemigo.getGenero());
                pstmt.setString(4, enemigo.getClase());
                pstmt.setInt(5, enemigo.getEdadEnemigo());
                pstmt.setInt(6, enemigo.getExperienciaEnemigo());
                pstmt.setString(7, enemigo.getObjeto());
                pstmt.setString(8, enemigo.getGenero());


                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
        /*EDITAR*/
        public void actualizar (String nombreEnemigo,int edadEnemigo, String genero, int claseIdHeroe, int nivelHeroe,
                                int idHeroe, int Ataque, int idPareja){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }
            /*cambiar los insert into por updates */
            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql =
                    "UPDATE heroe SET nombreHeroe = ?, edadHeroe = ?, Genero_generoid = ?, ClaseHeroe_idClaseHeroe = ?,NivelHeroe_idNivelHeroe = ? WHERE idHeroe = ?;" +
                            "UPDATE e SET e.ataque = ?, e.defensa = ?, e.velocidad = ?, e.poderMagico = ?, e.espiritu = ?, e.suerte =? FROM estadistica e, estadisticaheroe_has_heroe ehh, heroe h WHERE ehh.heroe_idheroe = ? and e.idestadisticaHeroe = ehh.estadisticaHeroe_idestadisticaHeroe;" +
                            "UPDATE p, rp, h SET p.idPareja = ?, p.heroe_idheroe = p.idPareja, rp.Pareja_idPareja = p.idPareja, h.Pareja_idPareja = rp.Pareja_idPareja FROM pareja p, heroe h, relacionpareja rp WHERE h.idheroe = ?, h.idheroe = rp.heroe_idheroe;";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {
                /*colocar campo correcto para actualizar*/
                pstmt.setString(1, nombreEnemigo);
                pstmt.setInt(2, Clase);
                pstmt.setInt(3, generoIdHeroe);
                pstmt.setInt(4, claseIdHeroe);
                pstmt.setInt(5, nivelHeroe);
                pstmt.setInt(6, idHeroe);
                pstmt.setInt(7, Ataque);
                pstmt.setInt(8, idPareja);


                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
}
