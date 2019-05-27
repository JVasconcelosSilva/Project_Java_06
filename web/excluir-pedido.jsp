<%@page import="br.com.project.jdbc.Pedido"%>
<%
    if (request.getParameter("id") != null) {
            long id_obra = Long.parseLong(request.getParameter("id"));

            Pedido.deletePedido(id_obra);
            //Pedido.updateObra(id_obra);
            response.sendRedirect("perfil.jsp");
        }
%>