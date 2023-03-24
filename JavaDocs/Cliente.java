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
public class Cliente {
    
    private String nombreCle;
    private String apellido1;
    private String apellido2;
    private Date fecha;

    public Cliente(String nombreCle, String apellido1, String apellido2, Date fecha) {
        this.nombreCle = nombreCle;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.fecha = fecha;
    }

    public Cliente() {
    }
    
    

    public String getNombreCle() {
        return nombreCle;
    }

    public void setNombreCle(String nombreCle) {
        this.nombreCle = nombreCle;
    }

    public String getApellido1() {
        return apellido1;
    }

    public void setApellido1(String apellido1) {
        this.apellido1 = apellido1;
    }

    public String getApellido2() {
        return apellido2;
    }

    public void setApellido2(String apellido2) {
        this.apellido2 = apellido2;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
    
    
}


