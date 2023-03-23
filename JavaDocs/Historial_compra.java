/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.beauty_salon.cr.entity;

import java.sql.Date;

/**
 *
 * @author Innovation Computers
 */
public class Historial_compra {
    
    private int id_Pxp;
    private int id_prod;
    private int id_prov;
    private Date fecha_compra;
    private int costo;    
    private int cantidad;

    public Historial_compra(int id_Pxp, int id_prod, int id_prov, Date fecha_compra, int costo, int cantidad) {
        this.id_Pxp = id_Pxp;
        this.id_prod = id_prod;
        this.id_prov = id_prov;
        this.fecha_compra = fecha_compra;
        this.costo = costo;
        this.cantidad = cantidad;
    }

    public int getId_Pxp() {
        return id_Pxp;
    }

    public void setId_Pxp(int id_Pxp) {
        this.id_Pxp = id_Pxp;
    }

    public int getId_prod() {
        return id_prod;
    }

    public void setId_prod(int id_prod) {
        this.id_prod = id_prod;
    }

    public int getId_prov() {
        return id_prov;
    }

    public void setId_prov(int id_prov) {
        this.id_prov = id_prov;
    }

    public Date getFecha_compra() {
        return fecha_compra;
    }

    public void setFecha_compra(Date fecha_compra) {
        this.fecha_compra = fecha_compra;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }
    
    
    

    
}
