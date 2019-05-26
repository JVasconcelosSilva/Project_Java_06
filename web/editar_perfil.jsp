<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>

<%
    Perfil perfil = (Perfil) session.getAttribute("perfil");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%if (session.getAttribute("perfil") != null) {%>
        <div class="container">
            <div class="col">
                <form method="post" action="perfil.jsp">
                    <div class="form-group">
                        <h1>Editar Perfil</h1>

                        <div class="form-group" action="perfil.jsp">
                                <label for="exampleDropdownFormPassword1">Numero de perfil</label>
                            <input type="text" class="form-control-plaintext border rounded" aria-label="Nome" aria-describedby="nome" readonly value=" <%=perfil.getId_perfil()%>">
                        </div>

                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Nome</label>
                            <input type="text" class="form-control" name="nomeEdit" maxlength="40" required value="<%=perfil.getNome()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleDropdownFormPassword1">Endereço</label>
                        <input type="text" class="form-control" maxlength="100" name="enderecoEdit" value="<%=perfil.getEndereco()%>">
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="exampleDropdownFormPassword1">CPF</label>
                            <input type="number" class="form-control" maxlength="11" name="cpfEdit" value="<%=perfil.getCpf()%>">
                        </div>
                        <div class="col">
                            <label for="exampleDropdownFormPassword1">Telefone</label>
                            <input type="number" class="form-control" maxlength="11" name="telefoneEdit" value="<%=perfil.getTelefone()%>" >
                        </div>
                    </div>
                    <br>
                    <%if (perfil.getDs_perfil() != null) {%>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Descrição</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" value="<%=perfil.getDs_perfil()%>" name="descEdit"></textarea>
                    </div>
                    <%} else {%>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea1">Descrição</label>
                        <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="descEdit"></textarea>
                    </div>
                    <%}%>
                    <br>
                    <input type="submit" class="btn btn-primary" name="formEditUser" value="Editar">
                </form>
            </div>
        </div>
        <%} else {
                response.sendRedirect("index.jsp");
            }%>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
