
package com.beauty_salon.cr.serverlets;

import com.beauty_salon.cr.bo.BeautySalonBO;
import com.beauty_salon.cr.entity.Empleado;
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
@WebServlet(name = "SvModificarEmpleado", urlPatterns = {"/SvModificarEmpleado"})
public class SvModificarEmpleado extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BeautySalonBO bsBO = new BeautySalonBO();
        Empleado emp = new Empleado();
        String mensaje = "";
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        String salarioStr = request.getParameter("salario");
        int salario = Integer.parseInt(salarioStr);
        
        emp.setSalario(salario);
        mensaje = bsBO.modificarEmpleado(emp, id);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
