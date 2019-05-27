<%@page import="java.text.DecimalFormat"%>
<%@page import="br.com.project.jdbc.Obra"%>
<%@page import="br.com.project.jdbc.Pedido"%>
<%@page import="br.com.project.jdbc.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>
<!DOCTYPE html>
<%
    if (session.getAttribute("perfil") != null) {
        Perfil perfil = (Perfil) session.getAttribute("perfil");
        long id = Long.parseLong(request.getParameter("id_obra"));
        DecimalFormat df = new DecimalFormat("#,###.00");
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br>
        <div class="container-fluid px-5">
            <div class="row ">
                <div class="col-12">
                    <div class="row border border-dark rounded-right">
                    </div>
                    <div class="row border border-dark rounded-right">
                        <div class="container">
                            <%Obra ob = Obra.updateObra(id);%>
                            <br>
                            <h3><%=ob.getNm_obra()%></h3>
                            <hr>
                            <p><%=ob.getObra()%></p>
                            <hr>
                            <p>Valor: R$ <%=df.format(ob.getVl_obra())%></p>
                            <hr>
                            <%if (perfil.getTipo_perfil().equals("comprador")) {%>
                            <a href="pedido.jsp?id_obra=<%=ob.getId_obra()%>" class="btn btn-dark">Comprar</a>
                            <%} else {%>
                            <button type="button" class="btn btn-secondary btn-lg" disabled>Comprar</button>
                            <%}%>
                            <br>
                            <br>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%} else {
                response.sendRedirect("index.jsp");
            }%>

    </body>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
</html>
