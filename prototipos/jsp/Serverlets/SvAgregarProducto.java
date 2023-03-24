
package com.beauty_salon.cr.serverlets;

import com.beauty_salon.cr.bo.BeautySalonBO;
import com.beauty_salon.cr.entity.Producto;
import com.beauty_salon.cr.entity.Provedor;
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
@WebServlet(name = "SvAgregarProducto", urlPatterns = {"/SvAgregarProducto"})
public class SvAgregarProducto extends HttpServlet {


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
        
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String precioStr = request.getParameter("total");
        int precio = Integer.parseInt(precioStr);
        
        prod.setNombreProd(nombre);
        prod.setDescripcion(descripcion);
        prod.setPrecio(precio);
        
        mensaje = bsBO.agregarProducto(prod);
        
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
        /*
        BeautySalonBO bsBO = new BeautySalonBO();
        Provedor prov = new Provedor();
        String mensaje = "";
        
        
        
        prov.setNombre_prov(nombre);
        */
        
        
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
