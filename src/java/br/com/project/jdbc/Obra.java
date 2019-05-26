package br.com.project.jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Jefferson V.
 */
public class Obra {

    private long id_obra;
    private double vl_obra;
    private String nm_obra;
    private String ds_obra;
    private long id_autor;
    private String dir_obra;

    public Obra(){
        
    }
    
    public Obra(long id_obra, double vl_obra, String nm_obra, String ds_obra, long id_autor, String dir_obra) {
        this.id_obra = id_obra;
        this.vl_obra = vl_obra;
        this.nm_obra = nm_obra;
        this.ds_obra = ds_obra;
        this.id_autor = id_autor;
        this.dir_obra = dir_obra;
    }

    public long getId_obra() {
        return id_obra;
    }

    public void setId_obra(long id_obra) {
        this.id_obra = id_obra;
    }

    public double getVl_obra() {
        return vl_obra;
    }

    public void setVl_obra(double vl_obra) {
        this.vl_obra = vl_obra;
    }

    public String getNm_obra() {
        return nm_obra;
    }

    public void setNm_obra(String nm_obra) {
        this.nm_obra = nm_obra;
    }

    public String getDs_obra() {
        return ds_obra;
    }

    public void setDs_obra(String ds_obra) {
        this.ds_obra = ds_obra;
    }

    public long getId_autor() {
        return id_autor;
    }

    public void setId_autor(long id_autor) {
        this.id_autor = id_autor;
    }
    
    public String getDir_obra() {
        return dir_obra;
    }

    public void setDir_obra(String dir_obra) {
        this.dir_obra = dir_obra;
    }

    public static ArrayList<Obra> getList() throws Exception {
        ArrayList<Obra> list = new ArrayList<>();
        Class.forName("org.apache.derby.jdbc.ClientDriver");
        String url = "jdbc:derby://localhost:1527/yunic";
        Connection con = DriverManager.getConnection(url, "app", "app");
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM OBRA");
        while (rs.next()) {
            Obra o = new Obra();
            o.setId_obra(rs.getLong("id_obra"));
            o.setVl_obra(rs.getDouble("vl_obra"));
            o.setNm_obra(rs.getString("nm_obra"));
            o.setDs_obra(rs.getString("ds_obra"));
            o.setId_autor(rs.getLong("id_autor"));
            o.setDir_obra(rs.getString("dir_obra"));
            list.add(o);
        }
        rs.close();
        st.close();
        con.close();
        return list;
    }

    public static void addObra(double vl_obra, String nm_obra, String ds_obra, long id_autor, String dir_obra) throws Exception{
            String SQL = "INSERT INTO OBRA (vl_obra, nm_obra, ds_obra, id_autor, dir_obra) VALUES ("
                    + ", ?"
                    + ", ?"
                    + ", ?"
                    + ", ?"
                    + ", ?"
                    + ")";
            Object parameters[] = {vl_obra, nm_obra, ds_obra, id_autor, dir_obra};
            DB.addObra(SQL, parameters);
    }
    
}
