package com.example.webapphr.model.beans;

public class Heroe {
    private int heroeId;
    private String nombre;
    private int edad;
    private String parejaHeroe;
    private int idInventarioHeroe;
    private String disponibilidadHeroe;
    private int idPareja;
    private int idGenero;

    private int claseHeroeId;
    private int nivelHeroeId;
    private int puntosXPheroe;

    private String Genero;
    private String Clase;
    private int ataqueHeroe;

    public String getGenero() {
        return Genero;
    }

    public void setGenero(String genero) {
        Genero = genero;
    }

    public String getClase() {
        return Clase;
    }

    public void setClase(String clase) {
        Clase = clase;
    }

    public int getAtaqueHeroe() {
        return ataqueHeroe;
    }

    public void setAtaqueHeroe(int ataqueHeroe) {
        this.ataqueHeroe = ataqueHeroe;
    }

    public int getHeroeId() {
        return heroeId;
    }

    public void setHeroeId(int heroeId) {
        this.heroeId = heroeId;
    }

    public int getClaseHeroeId() {
        return claseHeroeId;
    }

    public void setClaseHeroeId(int claseHeroeId) {
        this.claseHeroeId = claseHeroeId;
    }

    public int getNivelHeroeId() {
        return nivelHeroeId;
    }

    public void setNivelHeroeId(int nivelHeroeId) {
        this.nivelHeroeId = nivelHeroeId;
    }

    public int getPuntosXPheroe() {
        return puntosXPheroe;
    }

    public void setPuntosXPheroe(int puntosXPheroe) {
        this.puntosXPheroe = puntosXPheroe;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getParejaHeroe() {
        return parejaHeroe;
    }

    public void setParejaHeroe(String parejaHeroe) {
        this.parejaHeroe = parejaHeroe;
    }

    public int getIdInventarioHeroe() {
        return idInventarioHeroe;
    }

    public void setIdInventarioHeroe(int idInventarioHeroe) {
        this.idInventarioHeroe = idInventarioHeroe;
    }

    public String getDisponibilidadHeroe() {
        return disponibilidadHeroe;
    }

    public void setDisponibilidadHeroe(String disponibilidadHeroe) {
        this.disponibilidadHeroe = disponibilidadHeroe;
    }

    public int getIdPareja() {
        return idPareja;
    }

    public void setIdPareja(int idPareja) {
        this.idPareja = idPareja;
    }

    public int getIdGenero() {
        return idGenero;
    }

    public void setIdGenero(int idGenero) {
        this.idGenero = idGenero;
    }
}
