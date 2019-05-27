<%-- 
    Document   : obras
    Created on : 20/05/2019, 16:18:07
    Author     : a
--%>

<%@page import="br.com.project.jdbc.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>
<!DOCTYPE html>
<%
    Perfil perfil = (Perfil) session.getAttribute("perfil");

    if (request.getParameter("formAddObra") != null) {
        double vl_obra = Double.parseDouble(request.getParameter("vl_obra"));
        String nm_obra = request.getParameter("nm_obra");
        String ds_obra = request.getParameter("ds_obra");
        String obra = request.getParameter("obra");
        long id_autor = Long.parseLong(request.getParameter("id_autor"));

        Obra.addObra(vl_obra, nm_obra, ds_obra, id_autor, obra);
        response.sendRedirect("obras.jsp");
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yunic - Obras</title>
    </head>
    <body>
        <%if (session.getAttribute("perfil") != null) {%>
        <style>
            #customers {
                border-collapse: collapse;
                width: 100%;
            }

            #customers td, #customers th {
                border: 1px solid #ddd;
                padding: 8px;
                text-align: center;
            }

            #customers tr:nth-child(even){background-color: #f2f2f2;}

            #customers tr:hover {background-color: #ddd;}

            #customers th {
                padding-top: 12px;
                padding-bottom: 12px;
                text-align: left;
                background-color: #2E2E2E;
                color: white;
            }
        </style>
        <br>
        <div class="container">
            <table id="customers">
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                    <th>Descrição</th>
                    <th>ID Autor</th>
                    <th>Valor</th>
                    <th>Obra</th>
                    <th></th>
                </tr>
                <%for (Obra o : Obra.getList()) {%>
                <tr>
                    <td><%=o.getId_obra()%></td>
                    <td><%=o.getNm_obra()%></td>
                    <td><%=o.getDs_obra()%></td>
                    <td><%=o.getId_autor()%></td>
                    <td><%=o.getVl_obra()%></td>
                    <td><%=o.getObra()%></td>
                    <td><a href="pedido.jsp?id_obra=<%=o.getId_obra()%>" class="btn btn-dark">Comprar</a></td>
                </tr>
                <%}%>
            </table>
        </div>
        <br><br><br><br>
        <%} else {
                response.sendRedirect("index.jsp");
            }%>
    </body>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
</html> 