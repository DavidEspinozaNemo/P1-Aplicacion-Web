
package com.beauty_salon.cr.dao;

import com.beauty_salon.cr.entity.Bitacora_producto;
import com.beauty_salon.cr.entity.Bitacora_salario;
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
import java.sql.ResultSet;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import javax.swing.JTable;

/**
 *
 * @author keylo
 */
public class BeautySalonDAO {
    
    ResultSet rs;
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
    
     
    public List listarEmpleados(Connection conn){
        
        List<Empleado>lista = new ArrayList<>();
        PreparedStatement pst = null;
        String sql="Select * from empleado";
        try {
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                Empleado emp = new Empleado();    
                emp.setNombreEmp(rs.getString(2));
                emp.setApellido1(rs.getString(3));
                emp.setApellido2(rs.getString(4));
                emp.setSalario(rs.getInt(5));
                emp.setFecha(rs.getDate(6));
                emp.setCorreo(rs.getString(7));
                emp.setContacto(rs.getString(8));
                lista.add(emp);
                }
                            
        } catch (Exception e) {
        }
    return lista;
    }
    
    
    
        public List listarClientes(Connection conn){
        
        List<Cliente>lista = new ArrayList<>();
        PreparedStatement pst = null;
        String sql="Select * from cliente";
        try {
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                Cliente cle = new Cliente(); 
                cle.setNombreCle(rs.getString(2));
                cle.setApellido1(rs.getString(3));
                cle.setApellido2(rs.getString(4));
                cle.setFecha(rs.getDate(5));
                lista.add(cle);
                }
                            
        } catch (Exception e) {
        }
    return lista;
    }
        
            
       public List listarProvedores(Connection conn){
        
        List<Provedor>lista = new ArrayList<>();
        PreparedStatement pst = null;
        String sql="Select * from provedor";
        try {
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                Provedor prov = new Provedor();    
                
                prov.setNombre_prov(rs.getString(2));                
                prov.setFecha_registro(rs.getDate(3));
                lista.add(prov);
                }
                            
        } catch (Exception e) {
        }
    return lista;
    }
       
        public List listarProductos(Connection conn){
        
        List<Producto>lista = new ArrayList<>();
        PreparedStatement pst = null;
        String sql="Select * from producto";
        try {
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                Producto prod = new Producto();     
                prod.setNombreProd(rs.getString(2));
                prod.setDescripcion(rs.getString(3));
                prod.setPrecio(rs.getInt(4));
                lista.add(prod);
                }
                            
        } catch (Exception e) {
        }
    return lista;
    }
        
        
        public List listarBitacoraProductos(Connection conn){
        
        List<Bitacora_producto>lista = new ArrayList<>();
        PreparedStatement pst = null;
        String sql="Select * from Bitacora_producto";
        try {
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                Bitacora_producto bt = new Bitacora_producto();     
                bt.setId(rs.getInt(1));
                bt.setId_prod(rs.getInt(2));
                bt.setPrecio_viejo(rs.getInt(3));
                bt.setPrecio_nuevo(rs.getInt(4));
                bt.setFecha_cambio(rs.getDate(5));
                lista.add(bt);
                }
                            
        } catch (Exception e) {
        }
    return lista;
    }
        
        
        public List listarVenta(Connection conn){
        
        List<Venta>lista = new ArrayList<>();
        PreparedStatement pst = null;
        String sql="Select * from venta";
        try {
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                Venta ven = new Venta();     
                ven.setId_venta(rs.getInt(1));
                ven.setFecha_venta(rs.getDate(2));
                ven.setMonto_total(rs.getInt(3));
                ven.setId_empleado(rs.getInt(4));
                ven.setId_cliente(rs.getInt(5));
                lista.add(ven);
                }                            
        } catch (Exception e) {
        }
    return lista;
    }
        
        
        public List listarBitacoraSalarios(Connection conn){
        
        List<Bitacora_salario>lista = new ArrayList<>();
        PreparedStatement pst = null;
        String sql="Select * from bitacora_salario";
        try {
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                Bitacora_salario bs= new Bitacora_salario();     
                bs.setIdEntrada(rs.getInt(1));
                bs.setFecha_cambio(rs.getDate(2));
                bs.setUsuario(rs.getString(3));
                bs.setIdEmpleado(rs.getInt(4));
                bs.setSalario_registrado(rs.getInt(6));
                lista.add(bs);
                }
                            
        } catch (Exception e) {
        }
    return lista;
    }
       
        
        public List listarHistorialCompra(Connection conn){
        
        List<Historial_compra>lista = new ArrayList<>();
        PreparedStatement pst = null;
        String sql="Select * from Historial_compra";
        try {
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                Historial_compra hc = new Historial_compra();     
                hc.setId_Pxp(rs.getInt(1));
                hc.setFecha_compra(rs.getDate(2));
                hc.setCosto(rs.getInt(3));
                hc.setCantidad(rs.getInt(4));
                hc.setId_prov(rs.getInt(5));
                hc.setId_prod(rs.getInt(6));
                lista.add(hc);
                }
                            
        } catch (Exception e) {
        }
    return lista;
    }
        
    
        
        public List listarProductosVentas(Connection conn){
        
        List<ProductoXventa>lista = new ArrayList<>();
        PreparedStatement pst = null;
        String sql="Select * from producto_venta";
        try {
            pst = conn.prepareStatement(sql);
            rs=pst.executeQuery();
            while(rs.next()){
                ProductoXventa emp = new ProductoXventa();     
                emp.setId_producto(rs.getInt(2));
                emp.setId_venta(rs.getInt(3));
                emp.setPrecio(rs.getInt(4));
                emp.setCantidad(rs.getInt(5));
                lista.add(emp);
                }
                            
        } catch (Exception e) {
        }
    return lista;
    }
    

    
    
    
    
}
