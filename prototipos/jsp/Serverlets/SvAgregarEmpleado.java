
package com.beauty_salon.cr.serverlets;

import com.beauty_salon.cr.bo.BeautySalonBO;
import com.beauty_salon.cr.entity.Empleado;
import java.io.IOException;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author keylo
 */
@WebServlet(name = "SvEmpleado", urlPatterns = {"/SvEmpleado"})
public class SvAgregarEmpleado extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response3
     * 
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BeautySalonBO bsBO = new BeautySalonBO();
        Empleado emp = new Empleado();
        String mensaje = "";
        String nombre = request.getParameter("nombre");
        String apellido1 = request.getParameter("apellido1");
        String apellido2 = request.getParameter("apellido2");
        String salarioStr = request.getParameter("salario");
        int salario = Integer.parseInt(salarioStr);
        String fechaStr = request.getParameter("fecha");
        Date fecha = Date.valueOf(fechaStr);
        String correo = request.getParameter("correo");
        String contacto = request.getParameter("contacto");
        
        emp.setNombreEmp(nombre);
        emp.setApellido1(apellido1);
        emp.setApellido2(apellido2);
        emp.setSalario(salario);
        emp.setFecha(fecha);
        emp.setCorreo(correo);
        emp.setContacto(contacto);
        mensaje = bsBO.agregarEmpleado(emp);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
        /*
        System.out.println("Nombre: " + nombre);
        System.out.println("apellido1: " + apellido1);
        System.out.println("apellido2: " + apellido2);
        System.out.println("salario: " + salario);
        System.out.println("fechaStr: " + fechaStr);
        System.out.println("fecha: " + fecha);
        System.out.println("correo: " + correo);
        System.out.println("contacto: " + contacto);
        */
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
