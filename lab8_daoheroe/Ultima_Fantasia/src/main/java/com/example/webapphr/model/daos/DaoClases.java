package com.example.webapphr.model.daos;

import com.example.webapphr.model.beans.Clases;

import java.sql.*;
import java.util.ArrayList;

public class DaoClases {
    public ArrayList<Clases> listaClases(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/bbdd_lab8";
        ArrayList<Clases> listaClasess = new ArrayList<>();

        String sql = "SELECT * FROM objeto ORDER BY nombreObjeto ASC";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                Clases clases = new Clases();
                clases.setIdClases(rs.getInt(1));
                clases.setNombreClases(rs.getString(2));
                listaClasess.add(clases);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaClasess;
    }
}
