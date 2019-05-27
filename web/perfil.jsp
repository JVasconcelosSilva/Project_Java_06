<%@page import="br.com.project.jdbc.Obra"%>
<%@page import="br.com.project.jdbc.Pedido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>
<!DOCTYPE html>

<%
    if (session.getAttribute("perfil") != null) {
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
        <br>
        <div class="container-fluid px-5">

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
                            <%if (perfil.getTipo_perfil().equals("autor")) {%>
                            <a class="dropdown-item" href="add_obra.jsp">Adicionar Obra</a>
                            <%}%>
                        </div>
                    </div>
                    <br>
                </div>

                <div class="col-10">
                    <div class="row border border-dark rounded-right">
                        <%Pedido p = Pedido.getPedido(perfil.getId_perfil());%>
                        <div class="container">
                            <h3>Pedidos</h3>
                            <hr>
                            <%if (Pedido.getPedido(perfil.getId_perfil()) != null) {%>
                            <h4><%=p.getId_pedido()%></h4>
                            <%} else {%>
                            <br><h4>Nenhum pedido feito ainda</h4>
                            <%}%>
                            <br>
                        </div>
                    </div>
                    <%if (perfil.getTipo_perfil().equals("autor")) {%>
                    <div class="row border border-dark rounded-right">
                        <div class="container">
                            <h3>Suas Obras</h3>
                            <hr>
                            <%if (Obra.getObra(perfil.getId_perfil()) != null) {%>
                            <%for (Obra ob : Obra.getListAutor(perfil.getId_perfil())) {%>
                            <a href="#"><table id="customers">
                                    <tr>
                                        <td><img src=""></td>
                                    </tr>
                                    <tr>
                                        <td><%=ob.getNm_obra()%></td>
                                    </tr>
                                    <tr>
                                        <td><a href="editar-obra.jsp?id=<%=ob.getId_obra()%>" class="btn btn-dark">Editar</a></td>
                                    </tr>
                                </table>
                            </a>
                            <%}%>
                            <%} else {%>
                            <br><h4>Nenhuma obra publicada ainda</h4>
                            <%}%>
                            <br>
                        </div>
                    </div>
                    <%}%>
                </div>

            </div>
        </div>

        <%} else {
                response.sendRedirect("index.jsp");
            }%>

    </body>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
</html> 