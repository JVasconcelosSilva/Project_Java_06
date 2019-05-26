package br.com.project.jdbc;

import java.util.ArrayList;

public class Perfil {
    
    private long id_perfil;
    private long senha;
    private String nome;
    private int cpf;
    private String endereco;
    private int telefone;
    private String tipo_perfil;
    private String login;
    private String email;
    private String ds_perfil;

    public Perfil(long id_perfil, long senha, String nome, int cpf, String endereco, int telefone, String tipo_perfil, String login, String email, String ds_perfil) {
        this.id_perfil = id_perfil;
        this.senha = senha;
        this.nome = nome;
        this.cpf = cpf;
        this.endereco = endereco;
        this.telefone = telefone;
        this.tipo_perfil = tipo_perfil;
        this.login = login;
        this.email = email;
        this.ds_perfil = ds_perfil;
    }

    public String getDs_perfil() {
        return ds_perfil;
    }

    public void setDs_perfil(String ds_perfil) {
        this.ds_perfil = ds_perfil;
    }

    public long getId_perfil() {
        return id_perfil;
    }

    public void setId_perfil(long id_perfil) {
        this.id_perfil = id_perfil;
    }

    public long getSenha() {
        return senha;
    }

    public void setSenha(long senha) {
        this.senha = senha;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getCpf() {
        return cpf;
    }

    public void setCpf(int cpf) {
        this.cpf = cpf;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public int getTelefone() {
        return telefone;
    }

    public void setTelefone(int telefone) {
        this.telefone = telefone;
    }

    public String getTipo_perfil() {
        return tipo_perfil;
    }

    public void setTipo_perfil(String tipo_perfil) {
        this.tipo_perfil = tipo_perfil;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    public static Perfil getPerfil(String login, String pass) throws Exception{
        String SQL = "SELECT * FROM PERFIL WHERE LOGIN = ? AND SENHA = ?";
        Object parameters[] = {login, pass.hashCode()};
        ArrayList<Object[]> list = DB.getQuery(SQL, parameters);
        
        if(list.isEmpty()){
            return null;
        } else{
            Object row[] = list.get(0);
            Perfil p = new Perfil(
                    (long)row[0], 
                    (long) row[1] , 
                    (String)row[2], 
                    (int)row[3], 
                    (String)row[4], 
                    (int)row[5], 
                    (String)row[6], 
                    (String)row[7], 
                    (String)row[8], 
                    (String)row[9]);
            return p;
        }
    }
    
    public static void addPerfil(long senhaHash, String nome, int cpf, String endereco, int telefone, String tipo, String login, String email) throws Exception{
            String SQL = "INSERT INTO PERFIL(SENHA, NOME, CPF, ENDERECO, TELEFONE, TIPO_PERFIL, LOGIN, EMAIL) VALUES(" 
                    + " ?"
                    + ", ?"
                    + ", ?"
                    + ", ?"
                    + ", ?"
                    + ", ?"
                    + ", ?"
                    + ", ?"
                    + ")";
            Object parameters[] = {senhaHash, nome, cpf, endereco, telefone, tipo, login, email};
            
            DB.addPerfil(SQL, parameters);
    }
    
    public static void editPerfil(String nome, String endereco, int telefone, String ds_perfil, long id_perfil) throws Exception{
            String SQL = "UPDATE PERFIL SET NOME=?, ENDERECO=?, TELEFONE=?, DS_PERFIL=? WHERE ID_PERFIL=?";
            Object parameters[] = {nome, endereco, telefone, ds_perfil, id_perfil};
            
            DB.editPerfil(SQL, parameters);
    }
    
    public static Perfil updatePerfil(long id) throws Exception{
        String SQL = "SELECT * FROM PERFIL WHERE id_perfil = ?";
        Object parameters[] = {id};
        ArrayList<Object[]> list = DB.getQuery(SQL, parameters);
        
        if(list.isEmpty()){
            return null;
        } else{
            Object row[] = list.get(0);
            Perfil p = new Perfil(
                    (long)row[0], 
                    (long) row[1] , 
                    (String)row[2], 
                    (int)row[3], 
                    (String)row[4], 
                    (int)row[5], 
                    (String)row[6], 
                    (String)row[7], 
                    (String)row[8], 
                    (String)row[9]);
            return p;
        }
    }
    
}
