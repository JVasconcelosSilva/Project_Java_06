/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.project.jdbc;

import java.util.ArrayList;

/**
 *
 * @author Jefferson V.
 */
public class Perfil {
    
    private long id_perfil;
    private String senha;
    private String nome;
    private int cpf;
    private String endereco;
    private int telefone;
    private String tipo_perfil;
    private String login;
    private String email;
    private String ds_perfil;

    public Perfil(long id_perfil, String senha, String nome, int cpf, String endereco, int telefone, String tipo_perfil, String login, String email, String ds_perfil) {
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

    public void setId_perfil(int id_perfil) {
        this.id_perfil = id_perfil;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
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
                    (String)row[1], 
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
