<%@page import="br.com.project.jdbc.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>

<%
    Perfil perfil = (Perfil) session.getAttribute("perfil");
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yunic - Adicionar Obra</title>
    </head>
    <body>
        <%if (session.getAttribute("perfil") != null) {%>
        <div class="container">
            <div class="col">
                <form method="post" action="obras.jsp">
                    <div class="form-group">
                        <h1>Editar Perfil</h1>

                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Numero de perfil</label>
                            <input type="text" class="form-control-plaintext border rounded" name="id_autor" readonly value="<%=perfil.getId_perfil()%>">
                        </div>

                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Nome da obra</label>
                            <input type="text" class="form-control" name="nm_obra" maxlength="40" required >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleDropdownFormPassword1">Descrição da Obra</label>
                        <input type="text" class="form-control" maxlength="100" name="ds_obra">
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="exampleDropdownFormPassword1">Valor da Obra</label>
                            <input type="text" class="form-control" maxlength="11" name="vl_obra">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="exampleDropdownFormPassword1">Obra</label>
                            <input type="text" class="form-control" maxlength="11" name="obra">
                        </div>
                    </div>
                    <br>
                    <input type="submit" class="btn btn-primary" name="formAddObra" value="Adicionar Obra">
                </form>
            </div>
        </div>
        <%} else {
                response.sendRedirect("index.jsp");
            }%>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html> 