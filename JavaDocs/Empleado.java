
package com.beauty_salon.cr.entity;

import java.sql.Date;



/**
 *
 * @author keylo
 */
public class Empleado {
    
    private String nombreEmp;
    private String apellido1;
    private String apellido2;
    private int salario;
    private Date fecha;
    private String correo;
    private String contacto;

    public Empleado() {
    }

    public Empleado(String nombreEmp, String apellido1, String apellido2, int salario, Date fecha, String correo, String contacto) {
        this.nombreEmp = nombreEmp;
        this.apellido1 = apellido1;
        this.apellido2 = apellido2;
        this.salario = salario;
        this.fecha = fecha;
        this.correo = correo;
        this.contacto = contacto;
    }

    public String getNombreEmp() {
        return nombreEmp;
    }

    public void setNombreEmp(String nombreEmp) {
        this.nombreEmp = nombreEmp;
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

    public int getSalario() {
        return salario;
    }

    public void setSalario(int salario) {
        this.salario = salario;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getContacto() {
        return contacto;
    }

    public void setContacto(String contacto) {
        this.contacto = contacto;
    }

    @Override
    public String toString() {
        return "Empleado{" + "nombreEmp=" + nombreEmp + ", apellido1=" + apellido1 + ", apellido2=" + apellido2 + ", salario=" + salario + ", fecha=" + fecha + ", correo=" + correo + ", contacto=" + contacto + '}';
    }
    
    
    
}
