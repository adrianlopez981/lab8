package com.example.webapphr.model.daos;

import com.example.webapphr.model.beans.Heroe;

import java.sql.*;
import java.util.ArrayList;

public class DaoHeroe {

    public ArrayList<Heroe> lista() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
        ArrayList<Heroe> lista = new ArrayList<>();
        /*String sql = "select h.idheroe, h.nombreHeroe, h.edadHeroe, REPLACE(REPLACE(REPLACE(g.nombre,\"M\",\"Masculino\"),\"F\",\"Femenino\"),\"O\",\"Otros\") as nombreGenero,ch.nombreclaseheroe,h.nivelheroe_idnivelheroe as nivelInicialHeroe, eh.valorEstadistica as ataqueHeroe,h.pareja_idPareja, h.PuntosXPHeroe from bbdd_lab8.genero g, bbdd_lab8.heroe h, bbdd_lab8.claseheroe ch,bbdd_lab8.estadisticaheroe eh, bbdd_lab8.estadisticaheroe_has_heroe ehh\n" +
                "where ch.idclaseheroe = h.claseheroe_idclaseheroe\n" +
                "and g.idGenero = h.Genero_idGenero\n" +
                "and eh.idEstadisticaHeroe = ehh.EstadisticaHeroe_idEstadisticaHeroe and eh.nombreEstadistica = \"ataque\"\n" +
                "and ehh.heroe_idHeroe = h.idheroe\n" +
                "order by idheroe asc";*/
        String sql = "select * from heroe";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                Heroe heroe = new Heroe();
                heroe.setHeroeId(rs.getInt(1));
                heroe.setNombre(rs.getString(2));
                heroe.setEdad(rs.getInt(3));
                heroe.setGenero(rs.getString(4));
                heroe.setClase(rs.getString(5));
                heroe.setNivelHeroeId(rs.getInt(6));
                heroe.setAtaqueHeroe(rs.getInt(7));
                heroe.setIdPareja(rs.getInt(8));
                heroe.setPuntosXPheroe(ExperienciaHeroe(heroe.getNivelHeroeId()));
                lista.add(heroe);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return lista;
    }


    public void borrar(String HeroeId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
        String sql = "DELETE FROM heroe WHERE idHeroe = ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, HeroeId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public Heroe buscarPorId(String heroeId) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/bbdd_lab8";

        Heroe heroe = null;

        String sql = "select h.idheroe, h.nombreHeroe, h.edadHeroe, REPLACE(REPLACE(REPLACE(g.nombre,\"M\",\"Masculino\"),\"F\",\"Femenino\"),\"O\",\"Otros\") as nombreGenero,ch.nombreclaseheroe,h.nivelheroe_idnivelheroe as nivelInicialHeroe, eh.valorEstadistica as ataqueHeroe,h.pareja_idPareja, h.PuntosXPHeroe from bbdd_lab8.genero g, bbdd_lab8.heroe h, bbdd_lab8.claseheroe ch,bbdd_lab8.estadisticaheroe eh, bbdd_lab8.estadisticaheroe_has_heroe ehh\n" +
                "where ch.idclaseheroe = h.claseheroe_idclaseheroe\n" +
                "and g.idGenero = h.Genero_idGenero\n" +
                "and eh.idEstadisticaHeroe = ehh.EstadisticaHeroe_idEstadisticaHeroe and eh.nombreEstadistica = \"ataque\"\n" +
                "and ehh.heroe_idHeroe = h.idheroe\n" +
                "and h.idHeroe = ? order by idheroe asc;";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql);) {

            pstmt.setString(1, heroeId);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    heroe = new Heroe();
                    heroe.setHeroeId(rs.getInt(1));
                    heroe.setNombre(rs.getString(2));
                    heroe.setEdad(rs.getInt(3));
                    heroe.setGenero(rs.getString(4));
                    heroe.setClase(rs.getString(5));
                    heroe.setNivelHeroeId(rs.getInt(6));
                    heroe.setAtaqueHeroe(rs.getInt(7));
                    heroe.setIdPareja(rs.getInt(8));
                    heroe.setPuntosXPheroe(rs.getInt(9));
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return heroe;

    }

    public static void guardar(Heroe heroe){
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

            pstmt.setString(1, heroe.getNombre());
            pstmt.setInt(2, heroe.getEdad());
            pstmt.setInt(3, heroe.getIdGenero());
            pstmt.setInt(4, heroe.getClaseHeroeId());
            pstmt.setInt(5, heroe.getNivelHeroeId());
            pstmt.setInt(6, heroe.getAtaqueHeroe());
            pstmt.setInt(12, heroe.getIdPareja());

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

    public int ExperienciaHeroe(int e){
        int experiencia = 0;
        if(100>=e && e>=36){
            experiencia = (e*e*e)*(32+(e/2))/50;
        }
        else if(35>=e && 16<=e){
            experiencia = (e*e*e)*(14+e)/50;
        } else if (e<=15) {
            experiencia = (e*e*e)*(24+(e+1/3))/50;
        }
        return experiencia;
    }

}
