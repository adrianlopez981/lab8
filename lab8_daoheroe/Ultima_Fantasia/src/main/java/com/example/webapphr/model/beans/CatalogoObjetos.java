package com.example.webapphr.model.beans;

public class CatalogoObjetos {

    private int idCatalogoObjetos;
    private String nombre;
    private float efecto;
    private float peso;
    private String usoHeroe;

    public int getIdCatalogoObjetos() {
        return idCatalogoObjetos;
    }

    public void setIdCatalogoObjetos(int idCatalogoObjetos) {
        this.idCatalogoObjetos = idCatalogoObjetos;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public float getEfecto() {
        return efecto;
    }

    public void setEfecto(float efecto) {
        this.efecto = efecto;
    }

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public String getUsoHeroe() {
        return usoHeroe;
    }

    public void setUsoHeroe(String usoHeroe) {
        this.usoHeroe = usoHeroe;
    }
}
