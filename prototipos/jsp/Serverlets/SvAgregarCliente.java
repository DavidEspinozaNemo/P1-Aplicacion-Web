
package com.beauty_salon.cr.serverlets;

import com.beauty_salon.cr.bo.BeautySalonBO;
import com.beauty_salon.cr.entity.Cliente;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "SvAgregarCliente", urlPatterns = {"/SvAgregarCliente"})
public class SvAgregarCliente extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeautySalonBO bsBO = new BeautySalonBO();
        Cliente cle = new Cliente();
        String mensaje = "";
        
        String nombre = request.getParameter("nombre");
        String apellido1 = request.getParameter("apellido1");
        String apellido2 = request.getParameter("apellido2");
        String fechaStr = request.getParameter("fecha");
        Date fecha = Date.valueOf(fechaStr);
        
        cle.setNombreCle(nombre);
        cle.setApellido1(apellido1);
        cle.setApellido2(apellido2);
        cle.setFecha(fecha);
        
        mensaje = bsBO.agregarCliente(cle);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
