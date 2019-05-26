<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>
<!DOCTYPE html>

<%
    Perfil perfil = (Perfil) session.getAttribute("perfil");

    if (request.getParameter("formEditUser") != null) {

        long id_perfil = perfil.getId_perfil();
        String nome = request.getParameter("nomeEdit");
        String endereco = request.getParameter("enderecoEdit");
        int telefone = Integer.parseInt(request.getParameter("telefoneEdit"));
        String desc = request.getParameter("descEdit");

        Perfil.editPerfil(nome, endereco, telefone, desc, id_perfil);
        Perfil p = Perfil.updatePerfil(perfil.getId_perfil());
        session.setAttribute("perfil", p);
        response.sendRedirect("perfil.jsp");
    }

%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yunic - Perfil</title>
    </head>
    <body>
        <div class="container-fluid px-5">
            <%if (session.getAttribute("perfil") != null) {%>
            <div class="row ">
                <div class="col-2 border border-dark rounded-left">
                    <img src="_img/homer.jpg" class="img-thumbnail">
                    <br>
                    <br>
                    <div>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend ">
                                <span class="input-group-text" id="nome">Nome</span>
                            </div>
                            <input type="text" class="form-control-plaintext border rounded-right" aria-label="Nome" aria-describedby="nome" readonly value=" <%=perfil.getNome()%>">
                        </div>
                        <%if (perfil.getDs_perfil() != null) {%>
                        <div class="input-group">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="Descrição">Descrição</span>
                            </div>
                            <input type="text" class="form-control-plaintext border rounded-right" aria-label="Descrição" aria-describedby="Descrição" readonly value=" <%=perfil.getDs_perfil()%>">
                        </div>
                        <%} else {%>
                        <div class="input-group mb-3">
                            <div class="input-group-prepend">
                                <span class="input-group-text" id="Descrição">Descrição</span>
                            </div>
                            <input type="text" class="form-control-plaintext border rounded-right" aria-label="Descrição" aria-describedby="Descrição" readonly>
                        </div>
                        <%}%>
                    </div>
                    <br>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Opções
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="editar_perfil.jsp">Editar Perfil</a>
                            <a class="dropdown-item" href="perfil.jsp?editarFoto=1">Editar foto de perfil</a>
                        </div>
                    </div>
                    
                    <%if(request.getParameter("editarFoto").equals("1")){%>
                    <%}%>
                </div>

                <div class="col-10">
                    <div class="row border border-dark rounded-right">
                        <h3>Pedidos</h3>

                    </div>
                </div>
            </div>
        </div>

        <%} else {
                response.sendRedirect("index.jsp");
            }%>


    </body>
</html>