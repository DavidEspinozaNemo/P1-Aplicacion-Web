
package com.beauty_salon.cr.dao;

import com.beauty_salon.cr.entity.Cliente;
import com.beauty_salon.cr.entity.Empleado;
import com.beauty_salon.cr.entity.Historial_compra;
import com.beauty_salon.cr.entity.Producto;
import com.beauty_salon.cr.entity.ProductoXventa;
import com.beauty_salon.cr.entity.Provedor;
import com.beauty_salon.cr.entity.Venta;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import javax.swing.JTable;

/**
 *
 * @author keylo
 */
public class BeautySalonDAO {
    
    private String mensaje = "";
    
    public String agregarEmpleado(Connection conn, Empleado emp){
        CallableStatement pst = null;
        String sql = "call PACKAGE_CRUD.agregar_empleado(?,?,?,?,?,?,?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setString(1, emp.getNombreEmp());
            pst.setString(2, emp.getApellido1());
            pst.setString(3, emp.getApellido2());
            pst.setInt(4, emp.getSalario());
            pst.setDate(5, (Date) emp.getFecha());
            pst.setString(6, emp.getCorreo());
            pst.setString(7, emp.getContacto());
            mensaje = "Guardado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al agregar empleado \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String modificarEmpleado(Connection conn, Empleado emp, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.modificar_empleado(v_id => ?, v_salario => ?)"; 
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            pst.setInt(2, emp.getSalario());
            mensaje = "Modificado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al guardar empleado \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String borrarEmpleado(Connection conn, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.eliminar_empleado(?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            mensaje = "Borrado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al guardar empleado \n " + e.getMessage();
        }
        return mensaje;
    }
    
    
    
        public String agregarCliente(Connection conn, Cliente cle){
        CallableStatement pst = null;
        String sql = "call PACKAGE_CRUD.agregar_cliente(?,?,?,?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setString(1, cle.getNombreCle());
            pst.setString(2, cle.getApellido1());
            pst.setString(3, cle.getApellido2());
            pst.setDate(4, (Date) cle.getFecha());
            mensaje = "Guardado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al agregar cliente \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String modificarCliente(Connection conn, Cliente cle, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.modificar_cliente(v_id => ?, v_nombre => ?)"; 
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            pst.setString(2, cle.getNombreCle());
            mensaje = "Modificado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al guardar cliente \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String borrarCliente(Connection conn, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.eliminar_cliente(?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            mensaje = "Borrado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al eliminar cliente \n " + e.getMessage();
        }
        return mensaje;
    }
    
    
    
            public String agregarProvedor(Connection conn, Provedor prov){
        CallableStatement pst = null;
        String sql = "call PACKAGE_CRUD.agregar_provedor(?,?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setString(1, prov.getNombre_prov());
            pst.setDate(2, prov.getFecha_registro());
            mensaje = "Guardado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al agregar provedor \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String modificarProvedor(Connection conn, Provedor prov, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.modificar_provedor(v_id => ?, v_nombre => ?)"; 
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            pst.setString(2, prov.getNombre_prov());
            mensaje = "Modificado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al modificar provedor \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String borrarProvedor(Connection conn, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.eliminar_provedor(?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            mensaje = "Borrado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al eliminar provedor \n " + e.getMessage();
        }
        return mensaje;
    }
    
    
        public String agregarProducto(Connection conn, Producto prod){
        CallableStatement pst = null;
        String sql = "call PACKAGE_CRUD.agregar_producto(?,?,?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setString(1, prod.getNombreProd());
            pst.setString(2, prod.getDescripcion());
            pst.setInt(3, prod.getPrecio());
            mensaje = "Guardado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al agregar producto \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String modificarProducto(Connection conn, Producto prod, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.modificar_producto(v_id => ?, v_precio => ?)"; 
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            pst.setInt(3, prod.getPrecio());
            mensaje = "Modificado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al modificar producto \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String borrarProducto(Connection conn, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.eliminar_producto(?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            mensaje = "Borrado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al eliminar producto \n " + e.getMessage();
        }
        return mensaje;
    }
    
    
    
    
        public String agregarVenta(Connection conn, Venta ven){
        CallableStatement pst = null;
        String sql = "call PACKAGE_CRUD.agregar_venta(?,?,?,?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setDate(1, ven.getFecha_venta());
            pst.setInt(2, ven.getMonto_total());
            pst.setInt(3, ven.getId_empleado());
            pst.setInt(4, ven.getId_cliente());

            mensaje = "Guardado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al agregar venta \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String borrarVenta(Connection conn, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.eliminar_venta(?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            mensaje = "Borrado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al eliminar venta \n " + e.getMessage();
        }
        return mensaje;
    }
    
    
    
    public String agregarCompra(Connection conn, Historial_compra cmp){
        CallableStatement pst = null;
        String sql = "call PACKAGE_CRUD.agregar_hcompra(?,?,?,?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setDate(1, cmp.getFecha_compra());
            pst.setInt(2, cmp.getCosto());
            pst.setInt(3, cmp.getCantidad());
            pst.setInt(4, cmp.getId_prov());

            mensaje = "Guardado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al agregar compra \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String borrarCompra(Connection conn, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.eliminar_historial_compra(?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            mensaje = "Borrado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al eliminar historial de compra \n " + e.getMessage();
        }
        return mensaje;
    }
    
    
    
        public String agregarProductoV(Connection conn, ProductoXventa prdV){
        CallableStatement pst = null;
        String sql = "call PACKAGE_CRUD.agregar_productoV(?,?,?,?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, prdV.getId_producto());
            pst.setInt(2, prdV.getId_venta());
            pst.setInt(3, prdV.getPrecio());
            pst.setInt(4, prdV.getCantidad());

            mensaje = "Guardado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al agregar producto a venta \n " + e.getMessage();
        }
        return mensaje;
    }
    
    public String borrarProductoV(Connection conn, int id){
        
        PreparedStatement pst = null;
        String sql = "call PACKAGE_CRUD.eliminar_producto_venta(?)";
        
        try {
            pst = conn.prepareCall(sql);
            pst.setInt(1, id);
            mensaje = "Borrado Exitosamente";
            pst.execute();
            pst.close();
            
        } catch (Exception e) {
            mensaje = "Error al eliminar producto de venta \n " + e.getMessage();
        }
        return mensaje;
    }
    

    
    
    
    
}
