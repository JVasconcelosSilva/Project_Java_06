package br.com.project.jdbc;

import java.util.ArrayList;

/**
 *
 * @author Jefferson V.
 */
public class Pedido {
    
    private long id_pedido;
    private String nm_obra;
    private double vl_obra;
    private long id_cliente;
    private long id_obra;

    public Pedido(long id_pedido, String nm_obra, double vl_obra, long id_cliente, long id_obra) {
        this.id_pedido = id_pedido;
        this.nm_obra = nm_obra;
        this.vl_obra = vl_obra;
        this.id_cliente = id_cliente;
        this.id_obra = id_obra;
    }

    public long getId_obra() {
        return id_obra;
    }

    public void setId_obra(long id_obra) {
        this.id_obra = id_obra;
    }

    public long getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(long id_pedido) {
        this.id_pedido = id_pedido;
    }

    public String getNm_obra() {
        return nm_obra;
    }

    public void setNm_obra(String nm_obra) {
        this.nm_obra = nm_obra;
    }

    public double getVl_obra() {
        return vl_obra;
    }

    public void setVl_obra(double vl_obra) {
        this.vl_obra = vl_obra;
    }

    public long getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(long id_cliente) {
        this.id_cliente = id_cliente;
    }
    
    public static Pedido getPedido(long id) throws Exception{
        String SQL = "SELECT * FROM PEDIDOS WHERE ID_CLIENTE = ?";
        Object parameters[] = {id};
        ArrayList<Object[]> list = DB.getQuery(SQL, parameters);
        
        if(list.isEmpty()){
            return null;
        } else{
            Object row[] = list.get(0);
            Pedido p = new Pedido(
                    (long)row[0], 
                    (String) row[1] , 
                    (double)row[2], 
                    (long)row[3], 
                    (long)row[4]);
            return p;
        }
    }
    
    public static void addPedido(String nm_obra, double vl_obra, long id_cliente, long id_obra) throws Exception{
            String SQL = "INSERT INTO pedidos(NM_OBRA, VL_OBRA, ID_CLIENTE, ID_OBRA) VALUES(" 
                    + " ?"
                    + ", ?"
                    + ", ?"
                    + ", ?"
                    + ")";
            Object parameters[] = {nm_obra, vl_obra, id_cliente, id_obra};
            
            DB.addPerfil(SQL, parameters);
    }
    
}
