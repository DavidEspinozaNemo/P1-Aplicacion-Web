
package com.beauty_salon.cr.bo;

import com.beauty_salon.cr.dao.BeautySalonDAO;
import com.beauty_salon.cr.db.Conexion;
import com.beauty_salon.cr.entity.Cliente;
import com.beauty_salon.cr.entity.Empleado;
import com.beauty_salon.cr.entity.Historial_compra;
import com.beauty_salon.cr.entity.Producto;
import com.beauty_salon.cr.entity.ProductoXventa;
import com.beauty_salon.cr.entity.Provedor;
import com.beauty_salon.cr.entity.Venta;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author keylo
 */
public class BeautySalonBO {
    
    private String mensaje = "";
    private BeautySalonDAO bsDAO = new BeautySalonDAO();
    
    
    public String agregarEmpleado(Empleado emp){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.agregarEmpleado(conn, emp);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                mensaje = mensaje + " " + e.getMessage();
            }
        }
        return mensaje;
    }
    
    public String modificarEmpleado(Empleado emp, int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.modificarEmpleado(conn, emp, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
    public String eliminarEmpleado(int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.borrarEmpleado(conn, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
    
    
    
    
        public String agregarCliente(Cliente cle){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.agregarCliente(conn, cle);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                mensaje = mensaje + " " + e.getMessage();
            }
        }
        return mensaje;
    }
    
    public String modificarCliente(Cliente cle, int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.modificarCliente(conn, cle, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
    public String eliminarCliente(int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.borrarCliente(conn, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
        
        
       public String agregarProvedor(Provedor prov){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.agregarProvedor(conn, prov);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
    public String modificarProvedor(Provedor prov, int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.modificarProvedor(conn, prov, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
    public String eliminarProvedor(int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.borrarProvedor(conn, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
    
        public String agregarProducto(Producto pro){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.agregarProducto(conn, pro);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                mensaje = mensaje + " " + e.getMessage();
            }
        }
        return mensaje;
    }
    
    public String modificarProducto(Producto pro, int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.modificarProducto(conn, pro, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
    public String eliminarProducto(int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.borrarProducto(conn, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
        public String agregarVenta(Venta ven){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.agregarVenta(conn, ven);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                mensaje = mensaje + " " + e.getMessage();
            }
        }
        return mensaje;
    }
    

    
    public String eliminarVenta(int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.borrarVenta(conn, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
    public String agregarCompra(Historial_compra cmp){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.agregarCompra(conn, cmp);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                mensaje = mensaje + " " + e.getMessage();
            }
        }
        return mensaje;
    }
    

    
    public String eliminarCompra(int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.borrarCompra(conn, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
    
    
        public String agregarProductoVenta(ProductoXventa prodV){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.agregarProductoV(conn, prodV);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                mensaje = mensaje + " " + e.getMessage();
            }
        }
        return mensaje;
    }
    

    
    public String eliminarProductoVenta(int id){
        Connection conn = Conexion.getConnection();
        try {
            mensaje = bsDAO.borrarProductoV(conn, id);
            conn.commit();
            
        } catch (Exception e) {
            try {
                mensaje = mensaje + " " + e.getMessage();
                conn.rollback();
            } catch (SQLException ex) {
                Logger.getLogger(BeautySalonBO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }finally{
            try {
                if (conn != null) {
                    conn.close();
                } else {
                }
            } catch (Exception e) {
                
            }
        }
        return mensaje;
    }
           
    }
