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
        <title>Yunic - Editar Obra</title>
    </head>
    <body>
        <%if (session.getAttribute("perfil") != null) {%>
        <%long id = Long.parseLong(request.getParameter("id"));%>
        <%
            if (request.getParameter("formEditObra") != null) {

                long id_obra = Long.parseLong(request.getParameter("id_obra"));
                String nm_obra = request.getParameter("nm_obra");
                String ds_obra = request.getParameter("ds_obra");
                double vl_obra = Double.parseDouble(request.getParameter("vl_obra"));
                String obra = request.getParameter("obra");

                Obra.editObra(nm_obra, ds_obra, vl_obra, obra, id_obra);
                Obra.updateObra(id_obra);
                response.sendRedirect("perfil.jsp");
            }
            if (request.getParameter("formDeleteObra") != null) {
                try {
                    long id_obra = Long.parseLong(request.getParameter("id_obra"));

                    Obra.deleteObra(id_obra);
                    Obra.updateObra(id_obra);
                    response.sendRedirect("perfil.jsp");
                } catch (Exception e) {
        %>
        <h2>Não é possível excluir, essa obra ja foi vendida</h2>
        <%
                }
            }
        %>
        <%for (Obra o : Obra.listObra(id)) {%>
        <div class="container">
            <div class="col">
                <form method="post">
                    <div class="form-group">
                        <h1>Editar Obra</h1>

                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Numero de perfil</label>
                            <input type="text" class="form-control-plaintext border rounded" aria-label="Nome" aria-describedby="nome" readonly value=" <%=perfil.getId_perfil()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Numero da obra</label>
                            <input type="text" class="form-control-plaintext border rounded" name="id_obra" readonly value="<%=o.getId_obra()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Nome da obra</label>
                            <input type="text" class="form-control" name="nm_obra" maxlength="40" required value="<%=o.getNm_obra()%>">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleDropdownFormPassword1">Descrição da obra</label>
                        <input type="text" class="form-control" maxlength="100" name="ds_obra" value="<%=o.getDs_obra()%>">
                    </div>
                    <div class="row">
                        <div class="col">
                            <label for="exampleDropdownFormPassword1">Valor da Obra</label>
                            <input type="text" class="form-control" maxlength="11" name="vl_obra" value="<%=o.getVl_obra()%>">
                        </div>
                        <div class="col">
                            <label for="exampleDropdownFormPassword1">Obra</label>
                            <input type="text" class="form-control" maxlength="32000" name="obra" value="<%=o.getObra()%>" >
                        </div>
                    </div>
                    <br>
                    <br>
                    <input type="submit" class="btn btn-primary" name="formEditObra" value="Editar">
                    <input type="submit" class="btn btn-danger" name="formDeleteObra" value="Excluir Obra">
                </form>
            </div>
        </div>
        <%}%>
        <%} else {
                response.sendRedirect("index.jsp");
            }%>

    </body>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
</html>
