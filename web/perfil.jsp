<%-- 
    Document   : perfil
    Created on : 20/05/2019, 16:15:20
    Author     : Jefferson V.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yunic - Perfil</title>
    </head>
    <body>
        <div class="col-md-10">
        <img src="_img/homer.jpg" class="img-thumbnail">
        <label class="form-check-label" for="dropdownCheck">Homer</label>
        <div class="dropdown">
            <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                Dropdown button
            </button>
            <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="#">Editar Perfil</a>
            </div>
        </div>
        </div>
    </body>
</html>
