
package com.beauty_salon.cr.serverlets;

import com.beauty_salon.cr.bo.BeautySalonBO;
import com.beauty_salon.cr.entity.Provedor;
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
@WebServlet(name = "SvAgregarProvedor", urlPatterns = {"/SvAgregarProvedor"})
public class SvAgregarProvedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        BeautySalonBO bsBO = new BeautySalonBO();
        Provedor prov = new Provedor();
        String mensaje = "";
        
        String nombre = request.getParameter("nombre");
        String fechaStr = request.getParameter("date");
        Date fecha = Date.valueOf(fechaStr);
        
        prov.setNombre_prov(nombre);
        prov.setFecha_registro(fecha);
        
        mensaje = bsBO.agregarProvedor(prov);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
