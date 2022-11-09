package com.example.webapphr.model.daos;

import com.example.webapphr.model.beans.CatalogoObjetos;
import jakarta.servlet.RequestDispatcher;

import java.sql.*;
import java.util.ArrayList;

public class DaoCatalogoObjetos {

    public ArrayList<CatalogoObjetos> listaCatalogoObjetos() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        ArrayList<CatalogoObjetos> listaObjetos = new ArrayList<>();

        String sql = "select * from objeto";
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
                listaObjetos.add(catalogoObjetos);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaObjetos;
    }


    public void borrar(String IdCatalogoObjetos) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "DELETE FROM objeto WHERE idObjeto = ?";

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

        String url = "jdbc:mysql://localhost:3306/mydb";

        CatalogoObjetos catalogoObjetos = null;

        String sql = "SELECT * FROM objeto WHERE idObjeto=?";

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
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return catalogoObjetos;

    }

    public static void guardarCatalogo(CatalogoObjetos catalogoObjetos) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }


        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "INSERT INTO objeto (nombreObjeto, efecto/usoObjeto, pesoObjeto) VALUES (?,?,?);";


        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, catalogoObjetos.getNombre());
            pstmt.setFloat(2, catalogoObjetos.getEfecto());
            pstmt.setFloat(3, catalogoObjetos.getPeso());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public void actualizarCatalogo(int idCatalogo, String nombre, float efecto, float peso) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        /*cambiar los insert into por updates */
        String url = "jdbc:mysql://localhost:3306/mydb";
        String sql = "UPDATE objeto SET nombreObjeto=?, efecto/usoObjeto=?, pesoObjeto=? WHERE idObjeto=?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, nombre);
            pstmt.setFloat(2, efecto);
            pstmt.setFloat(3, peso);
            pstmt.setInt(4, idCatalogo);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


    }

    public boolean validarCatalogoObjetos_nombre(String nombreCatalogoObjetos){
        boolean valido = true;
        ArrayList<CatalogoObjetos> listaCatalogo = listaCatalogoObjetos();

        for(CatalogoObjetos catalogoObjetos : listaCatalogo){
            if(nombreCatalogoObjetos.equalsIgnoreCase(catalogoObjetos.getNombre())){
                valido = false;
            }
        }

        return valido;
    }



    public ArrayList<CatalogoObjetos> buscador(String nombreObjeto){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String url = "jdbc:mysql://localhost:3306/mydb";
        ArrayList<CatalogoObjetos> listaObjeto = new ArrayList<>();
        String sql = "SELECT * FROM objeto WHERE lower(nombreObjeto) like ?";

        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             PreparedStatement pstmt = connection.prepareStatement(sql)) {

            pstmt.setString(1, "%"+nombreObjeto+"%");

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    CatalogoObjetos catalogoObjetos = new CatalogoObjetos();
                    catalogoObjetos.setIdCatalogoObjetos(rs.getInt(1));
                    catalogoObjetos.setNombre(rs.getString(2));
                    catalogoObjetos.setEfecto(rs.getFloat(3));
                    catalogoObjetos.setPeso(rs.getFloat(4));
                    listaObjeto.add(catalogoObjetos);
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return listaObjeto;
    }

    /*Por el id del catalogo*/
    public ArrayList<CatalogoObjetos> IdlistaCatalogoObjetos(){

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        ArrayList<CatalogoObjetos> listaCatalogoObjetos = new ArrayList<>();

        String sql = "SELECT * FROM objeto ORDER BY idObjeto ASC";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                CatalogoObjetos catalogoObjetos = new CatalogoObjetos();
                catalogoObjetos.setIdCatalogoObjetos(rs.getInt(1));
                catalogoObjetos.setNombre(rs.getString(2));
                catalogoObjetos.setEfecto(rs.getFloat(3));
                catalogoObjetos.setPeso(rs.getFloat(4));
                listaCatalogoObjetos.add(catalogoObjetos);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaCatalogoObjetos;

    }
    /*Por nombre del objeto*/
    public ArrayList<CatalogoObjetos> nombreCatalogoLista(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        ArrayList<CatalogoObjetos> listaCatalogoObjetos = new ArrayList<>();

        String sql = "SELECT * FROM objeto ORDER BY nombreObjeto ASC";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                CatalogoObjetos catalogoObjetos = new CatalogoObjetos();
                catalogoObjetos.setIdCatalogoObjetos(rs.getInt(1));
                catalogoObjetos.setNombre(rs.getString(2));
                catalogoObjetos.setEfecto(rs.getFloat(3));
                catalogoObjetos.setPeso(rs.getFloat(4));
                listaCatalogoObjetos.add(catalogoObjetos);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaCatalogoObjetos;
    }

    /*por peso*/
    public ArrayList<CatalogoObjetos> pesoCatalogoObjetoLista(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        ArrayList<CatalogoObjetos> listaCatalogoObjetos = new ArrayList<>();

        String sql = "SELECT * FROM objeto ORDER BY pesoObjeto ASC";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                CatalogoObjetos catalogoObjetos = new CatalogoObjetos();
                catalogoObjetos.setIdCatalogoObjetos(rs.getInt(1));
                catalogoObjetos.setNombre(rs.getString(2));
                catalogoObjetos.setEfecto(rs.getFloat(3));
                catalogoObjetos.setPeso(rs.getFloat(4));
                listaCatalogoObjetos.add(catalogoObjetos);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaCatalogoObjetos;
    }

    /*por efecto*/
    public ArrayList<CatalogoObjetos> efectoCatalogoObjetoLista(){
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        String url = "jdbc:mysql://localhost:3306/mydb";
        ArrayList<CatalogoObjetos> listaCatalogoObjetos = new ArrayList<>();

        String sql = "SELECT * FROM objeto ORDER BY efecto/usoObjeto ASC";
        try (Connection connection = DriverManager.getConnection(url, "root", "root");
             Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(sql);) {

            while (rs.next()) {
                CatalogoObjetos catalogoObjetos = new CatalogoObjetos();
                catalogoObjetos.setIdCatalogoObjetos(rs.getInt(1));
                catalogoObjetos.setNombre(rs.getString(2));
                catalogoObjetos.setEfecto(rs.getFloat(3));
                catalogoObjetos.setPeso(rs.getFloat(4));
                listaCatalogoObjetos.add(catalogoObjetos);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return listaCatalogoObjetos;
    }
    /*Sí es usado por algun heroe*/
    public void Si_editarCatalogoObjetos(float efecto, int idCatalogoObjetos) throws SQLException {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String user = "root";
        String pasw = "root";
        String url ="jdbc:mysql://localhost:3306/mydb";
        String sql = "UPDATE objeto SET efecto/usoObjeto = ? WHERE idObjeto =?";

        try(Connection connection = DriverManager.getConnection(url, user, pasw);
            PreparedStatement prepareStatement = connection.prepareStatement(sql)){
            prepareStatement.setFloat(1,efecto);
            prepareStatement.setInt(2,idCatalogoObjetos);

            prepareStatement.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }

    }

    /*No es usado por algun heroe*/
    public void No_editarCatalogoObjetos(float efecto, float peso, int idCatalogoObjetos) throws SQLException {
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String user = "root";
        String pasw = "root";
        String url ="jdbc:mysql://localhost:3306/mydb";
        String sql = "UPDATE objeto SET efecto/usoObjeto = ?, pesoObjeto=? WHERE idObjeto =?";

        try(Connection connection = DriverManager.getConnection(url, user, pasw);
            PreparedStatement prepareStatement = connection.prepareStatement(sql)){
            prepareStatement.setFloat(1,efecto);
            prepareStatement.setFloat(2,peso);
            prepareStatement.setInt(3,idCatalogoObjetos);
            prepareStatement.executeUpdate();

        }catch (SQLException e){
            e.printStackTrace();
        }

    }
    public void agregarCataObjeto(String nombre,String efecti, float peso, boolean usado) {

        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        String user = "root";
        String pasw = "root";
        String url ="jdbc:mysql://localhost:3306/mydb";
        String sql = "INSERT INTO objeto (pesoObjeto, nombreObjeto, efecto/usoObjeto) VALUES (?,?,?)";


        try (Connection connection = DriverManager.getConnection(url, user, pasw);
             PreparedStatement pstmt1 = connection.prepareStatement(sql)) {

            pstmt1.setString(2,nombre);
            pstmt1.setString(3, efecti);
            pstmt1.setFloat(1,peso);
            pstmt1.setBoolean(4,usado);
            pstmt1.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}

