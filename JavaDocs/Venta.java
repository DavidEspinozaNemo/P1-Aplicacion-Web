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
public class Venta {
    
     private int  id_venta;
     private int  id_empleado;
     private int  id_cliente;
     private Date fecha_venta;
     private int  monto_total;

    public Venta(int id_venta, int id_empleado, int id_cliente, Date fecha_venta, int monto_total) {
        this.id_venta = id_venta;
        this.id_empleado = id_empleado;
        this.id_cliente = id_cliente;
        this.fecha_venta = fecha_venta;
        this.monto_total = monto_total;
    }

    public int getId_venta() {
        return id_venta;
    }

    public void setId_venta(int id_venta) {
        this.id_venta = id_venta;
    }

    public int getId_empleado() {
        return id_empleado;
    }

    public void setId_empleado(int id_empleado) {
        this.id_empleado = id_empleado;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public Date getFecha_venta() {
        return fecha_venta;
    }

    public void setFecha_venta(Date fecha_venta) {
        this.fecha_venta = fecha_venta;
    }

    public int getMonto_total() {
        return monto_total;
    }

    public void setMonto_total(int monto_total) {
        this.monto_total = monto_total;
    }
     
     
    
}
