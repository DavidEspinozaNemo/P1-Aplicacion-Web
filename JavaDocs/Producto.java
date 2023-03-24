/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beauty_salon.cr.entity;

/**
 *
 * @author Innovation Computers
 */
public class Producto {
    
    private String nombreProd;
    private String descripcion;
    private int precio;

    public Producto(String nombreProd, String descripcion, int precio) {
        this.nombreProd = nombreProd;
        this.descripcion = descripcion;
        this.precio = precio;
    }

    public Producto() {
    }
    

    public String getNombreProd() {
        return nombreProd;
    }

    public void setNombreProd(String nombreProd) {
        this.nombreProd = nombreProd;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }
    
    
    
}
