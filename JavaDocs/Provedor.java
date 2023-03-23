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
public class Provedor {
    
    
    
    private String nombre_prov;
    private Date fecha_registro;

    public Provedor(String nombre_prov, Date fecha_registro) {
        this.nombre_prov = nombre_prov;
        this.fecha_registro = fecha_registro;
    }

    public String getNombre_prov() {
        return nombre_prov;
    }

    public void setNombre_prov(String nombre_prov) {
        this.nombre_prov = nombre_prov;
    }

    public Date getFecha_registro() {
        return fecha_registro;
    }

    public void setFecha_registro(Date fecha_registro) {
        this.fecha_registro = fecha_registro;
    }
    
    
    
    
}
