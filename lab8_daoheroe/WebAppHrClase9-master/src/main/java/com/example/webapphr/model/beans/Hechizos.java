package com.example.webapphr.model.beans;

public class Hechizos {
    private String nombre;
    private int idHechizo;
    private String elemento;
    private float potencia;
    private float precision;
    private String hechizobase;
    private float nivelAprendizaje;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getIdHechizo() {
        return idHechizo;
    }

    public void setIdHechizo(int idHechizo) {
        this.idHechizo = idHechizo;
    }

    public String getElemento() {
        return elemento;
    }

    public void setElemento(String elemento) {
        this.elemento = elemento;
    }

    public float getPotencia() {
        return potencia;
    }

    public void setPotencia(float potencia) {
        this.potencia = potencia;
    }

    public float getPrecision() {
        return precision;
    }

    public void setPrecision(float precision) {
        this.precision = precision;
    }

    public String getHechizobase() {
        return hechizobase;
    }

    public void setHechizobase(String hechizobase) {
        this.hechizobase = hechizobase;
    }

    public float getNivelAprendizaje() {
        return nivelAprendizaje;
    }

    public void setNivelAprendizaje(float nivelAprendizaje) {
        this.nivelAprendizaje = nivelAprendizaje;
    }
}
