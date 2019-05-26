<%-- 
    Document   : obras
    Created on : 20/05/2019, 16:18:07
    Author     : a
--%>

<%@page import="br.com.project.jdbc.Obra"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>
<!DOCTYPE html>
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
                <th>Obra</th>
                <th>Nome</th>
                <th>Descrição</th>
                <th>Autor</th>
                <th>Valor</th>
                <th></th>
            </tr>
            <%for(Obra o: Obra.getList()){%>
            <tr>
                <td><img src="<%=o.getDir_obra()%>"></td>
                <td><%=o.getNm_obra()%></td>
                <td><%=o.getDs_obra()%></td>
                <td><%=o.getNm_obra()%></td>
                <td><%=o.getVl_obra()%></td>
                <td><a href="#" class="btn btn-dark">Comprar</a></td>
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
