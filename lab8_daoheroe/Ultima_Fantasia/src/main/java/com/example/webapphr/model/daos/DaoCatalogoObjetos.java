package com.example.webapphr.model.daos;

import com.example.webapphr.model.beans.CatalogoObjetos;

import java.sql.*;
import java.util.ArrayList;

public class DaoCatalogoObjetos {

        public ArrayList<CatalogoObjetos> lista() {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            ArrayList<CatalogoObjetos> lista = new ArrayList<>();
            //editar
            String sql = "select h.idCatalogoObjeos, h.nombre, h.edadHeroe, REPLACE(REPLACE(REPLACE(g.nombre,\"M\",\"Masculino\"),\"F\",\"Femenino\"),\"O\",\"Otros\") as nombreGenero,ch.nombreclaseheroe,h.nivelheroe_idnivelheroe as nivelInicialHeroe, eh.valorEstadistica as ataqueHeroe,h.pareja_idPareja, h.PuntosXPHeroe from bbdd_lab8.genero g, bbdd_lab8.heroe h, bbdd_lab8.claseheroe ch,bbdd_lab8.estadisticaheroe eh, bbdd_lab8.estadisticaheroe_has_heroe ehh\n" +
                    "where ch.idclaseheroe = h.claseheroe_idclaseheroe\n" +
                    "and g.idGenero = h.Genero_idGenero\n" +
                    "and eh.idEstadisticaHeroe = ehh.EstadisticaHeroe_idEstadisticaHeroe and eh.nombreEstadistica = \"ataque\"\n" +
                    "and ehh.heroe_idHeroe = h.idheroe\n" +
                    "order by idheroe asc";
            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 Statement stmt = connection.createStatement();
                 ResultSet rs = stmt.executeQuery(sql);) {

                while (rs.next()) {
                    CatalogoObjetos catalogoObjetos = new CatalogoObjetos();
                    catalogoObjetos.setIdCatalogoObjetos(rs.getInt(1));
                    catalogoObjetos.setNombre(rs.getString(2));
                    catalogoObjetos.setEfecto(rs.getFloat(3));
                    catalogoObjetos.setPeso(rs.getFloat(4));
                    catalogoObjetos.setUsoHeroe(rs.getString(5));

                    /*catalogoObjetos.setNivelHeroeId(rs.getInt(6));
                    catalogoObjetos.setAtaqueHeroe(rs.getInt(7));
                    catalogoObjetos.setIdPareja(rs.getInt(8));
                    catalogoObjetos.setPuntosXPheroe(rs.getInt(9));*/
                    lista.add(catalogoObjetos);
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return lista;
        }


        public void borrar(String IdCatalogoObjetos) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
            String sql = "DELETE FROM heroe WHERE idHeroe/*editar*/ = ?";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql)) {

                pstmt.setString(1, IdCatalogoObjetos);
                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        public CatalogoObjetos buscarPorId(String idCatalogoObjetos) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            String url = "jdbc:mysql://localhost:3306/bbdd_lab8";

            CatalogoObjetos catalogoObjetos = null;
            /*editar*/
            String sql = "select h.idheroe, h.nombreHeroe, h.edadHeroe, REPLACE(REPLACE(REPLACE(g.nombre,\"M\",\"Masculino\"),\"F\",\"Femenino\"),\"O\",\"Otros\") as nombreGenero,ch.nombreclaseheroe,h.nivelheroe_idnivelheroe as nivelInicialHeroe, eh.valorEstadistica as ataqueHeroe,h.pareja_idPareja, h.PuntosXPHeroe from bbdd_lab8.genero g, bbdd_lab8.heroe h, bbdd_lab8.claseheroe ch,bbdd_lab8.estadisticaheroe eh, bbdd_lab8.estadisticaheroe_has_heroe ehh\n" +
                    "where ch.idclaseheroe = h.claseheroe_idclaseheroe\n" +
                    "and g.idGenero = h.Genero_idGenero\n" +
                    "and eh.idEstadisticaHeroe = ehh.EstadisticaHeroe_idEstadisticaHeroe and eh.nombreEstadistica = \"ataque\"\n" +
                    "and ehh.heroe_idHeroe = h.idheroe\n" +
                    "and h.idHeroe = ? order by idheroe asc;";

            try (Connection connection = DriverManager.getConnection(url, "root", "root");
                 PreparedStatement pstmt = connection.prepareStatement(sql);) {

                pstmt.setString(1, idCatalogoObjetos);

                try (ResultSet rs = pstmt.executeQuery()) {
                    if (rs.next()) {
                        catalogoObjetos = new CatalogoObjetos();
                        catalogoObjetos.setIdCatalogoObjetos(rs.getInt(1));
                        catalogoObjetos.setNombre(rs.getString(2));
                        catalogoObjetos.setEfecto(rs.getFloat(3));
                        catalogoObjetos.setPeso(rs.getFloat(4));
                        catalogoObjetos.setUsoHeroe(rs.getString(5));

                        /*catalogoObjetos.setNivelHeroeId(rs.getInt(6));
                        catalogoObjetos.setAtaqueHeroe(rs.getInt(7));
                        catalogoObjetos.setIdPareja(rs.getInt(8));
                        catalogoObjetos.setPuntosXPheroe(rs.getInt(9));*/
                    }
                }
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            return catalogoObjetos;

        }

        public static void guardar(CatalogoObjetos catalogoObjetos){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new RuntimeException(e);
            }

            /*editaaar*/
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

                pstmt.setString(1, catalogoObjetos.getNombre());
                pstmt.setFloat(2, catalogoObjetos.getEfecto());
                pstmt.setFloat(3, catalogoObjetos.getPeso());
                pstmt.setString(4, catalogoObjetos.getUsoHeroe());

               /*
                pstmt.setInt(5, catalogoObjetos.getNivelHeroeId());
                pstmt.setInt(6, catalogoObjetos.getAtaqueHeroe());
                pstmt.setInt(12, catalogoObjetos.getIdPareja());

                */

                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

        public void actualizar (String nombreHeroe,int edadHeroe, int generoIdHeroe, int claseIdHeroe, int nivelHeroe,
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
                pstmt.setString(1, nombreHeroe);
                pstmt.setInt(2, edadHeroe);
                pstmt.setInt(3, generoIdHeroe);
                pstmt.setInt(4, claseIdHeroe);
                pstmt.setInt(5, nivelHeroe);
                pstmt.setInt(6, idHeroe);
                pstmt.setInt(7, Ataque);
                pstmt.setInt(14, idPareja);


                pstmt.executeUpdate();

            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }

}
