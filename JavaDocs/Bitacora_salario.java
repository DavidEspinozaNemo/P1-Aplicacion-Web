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
public class Bitacora_salario {
    
    
    private int idEntrada;
    private int idEmpleado;
    private Date fecha_cambio;
    private String usuario;
    private int salario_registrado;

    public Bitacora_salario(int idEntrada, int idEmpleado, Date fecha_cambio, String usuario, int salario_registrado) {
        this.idEntrada = idEntrada;
        this.idEmpleado = idEmpleado;
        this.fecha_cambio = fecha_cambio;
        this.usuario = usuario;
        this.salario_registrado = salario_registrado;
    }

    public int getIdEntrada() {
        return idEntrada;
    }

    public void setIdEntrada(int idEntrada) {
        this.idEntrada = idEntrada;
    }

    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public Date getFecha_cambio() {
        return fecha_cambio;
    }

    public void setFecha_cambio(Date fecha_cambio) {
        this.fecha_cambio = fecha_cambio;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public int getSalario_registrado() {
        return salario_registrado;
    }

    public void setSalario_registrado(int salario_registrado) {
        this.salario_registrado = salario_registrado;
    }
    
    
    
    
    
}
