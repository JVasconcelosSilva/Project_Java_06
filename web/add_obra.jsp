<%@page import="br.com.project.jdbc.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>

<%
    Perfil perfil = (Perfil) session.getAttribute("perfil");
    
    if (request.getParameter("formAddObra") != null) {
        double vl_obra = Double.parseDouble(request.getParameter("vl_obra"));
        String nm_obra = request.getParameter("nm_obra");
        String ds_obra = request.getParameter("ds_obra");
        long id_autor = Long.parseLong(request.getParameter("id_autor"));
        String dir_obra = request.getParameter("dir_obra");

        Obra.addObra(vl_obra, nm_obra, ds_obra, id_autor, dir_obra);
        response.sendRedirect("login.jsp");
    }
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
                <form method="post" action="perfil.jsp">
                    <div class="form-group">
                        <h1>Editar Perfil</h1>

                        <div class="form-group" action="perfil.jsp">
                            <label for="exampleDropdownFormPassword1">Numero de perfil</label>
                            <input type="text" class="form-control-plaintext border rounded" name="id_autor">
                        </div>

                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Nome da obra</label>
                            <input type="text" class="form-control" name="nomeEdit" maxlength="40" required value="nm_obra">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleDropdownFormPassword1">Descrição da Obra</label>
                        <input type="text" class="form-control" maxlength="100" name="enderecoEdit" value="ds_obra">
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="exampleDropdownFormPassword1">Imagem</label>
                            <input type="file" name="fileToUpload" id="fileToUpload">
                        </div>
                        <div class="col">
                            <label for="exampleDropdownFormPassword1">Valor da Obra</label>
                            <input type="text" class="form-control" maxlength="11" name="vl_obra">
                        </div>
                    </div>
                    <br>
                    <input type="submit" class="btn btn-primary" name="formaddObra" value="Editar">
                </form>
            </div>
        </div>
        <%} else {
                response.sendRedirect("index.jsp");
            }%>
        <%@include file="WEB-INF/jspf/footer.jspf"%>
    </body>
</html>
