
package com.beauty_salon.cr.serverlets;

import com.beauty_salon.cr.bo.BeautySalonBO;
import com.beauty_salon.cr.entity.Producto;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author keylo
 */
@WebServlet(name = "SvModificarProducto", urlPatterns = {"/SvModificarProducto"})
public class SvModificarProducto extends HttpServlet {

    
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
        Producto prod = new Producto();
        String mensaje = "";
        
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        String precioStr = request.getParameter("total");
        int precio = Integer.parseInt(precioStr);
        
        prod.setPrecio(precio);
        
        mensaje = bsBO.modificarProducto(prod, id);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
