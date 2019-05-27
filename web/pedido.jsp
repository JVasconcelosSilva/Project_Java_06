<%-- 
    Document   : pedido
    Created on : 26/05/2019, 19:20:51
    Author     : andre
--%>

<%@page import="br.com.project.jdbc.Pedido"%>
<%@page import="br.com.project.jdbc.Perfil"%>
<%@page import="br.com.project.jdbc.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@include file="WEB-INF/jspf/header.jspf"%>
<%
    Obra o = Obra.updateObra(Integer.parseInt(request.getParameter("id_obra")));
    Perfil perfil = (Perfil) session.getAttribute("perfil");

    if (!perfil.getTipo_perfil().equals("comprador") || request.getParameter("id_obra") == null) {
        response.sendRedirect("index.jsp");
    }
    
    if(request.getParameter("confirmaPedido") != null){
    String nm_obra = request.getParameter("nm_obra");
    Double vl_obra = Double.parseDouble(request.getParameter("vl_obra"));
    long id_cliente = Long.parseLong(request.getParameter("id_cliente"));
    long id_obra = Long.parseLong(request.getParameter("id_obra"));
    Pedido.addPedido(nm_obra, vl_obra, id_cliente, id_obra);
    response.sendRedirect("perfil.jsp");
    }
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
            <div class="col">
                <form method="post">
                    <div class="form-group">
                        <h1>Realizar Pedido</h1>

                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Nome da Obra</label>
                            <input type="text" class="form-control-plaintext border rounded" name="nm_obra" readonly value="<%=o.getNm_obra()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Valor</label>
                            <input type="text" class="form-control-plaintext border rounded" name="vl_obra" readonly value="<%=o.getVl_obra()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Numero de perfil</label>
                            <input type="text" class="form-control-plaintext border rounded" name="id_cliente" readonly value="<%=perfil.getId_perfil()%>">
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownFormPassword1">Numero da obra</label>
                            <input type="text" class="form-control-plaintext border rounded" name="id_obra" readonly value="<%=o.getId_obra()%>">
                        </div>
                        <input type="submit" class="btn btn-primary" name="confirmaPedido" value="Confirmar pedido">
                    </div>
                </form>
            </div>
        </div> 
    </body>
</html>
