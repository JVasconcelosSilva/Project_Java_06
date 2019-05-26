<%-- 
    Document   : index
    Created on : 20/05/2019, 16:14:26
    Author     : Jefferson V.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/header.jspf"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Yunic</title>

    </head>

    <body>
        <style>
            #customers {
                border-collapse: collapse;
                float: left;
                margin: 5px 5px 5px 5px;
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
            <a href="#"><table id="customers">
                    <tr>
                        <td><img src="_img/homer.jpg"></td>
                    </tr>
                    <tr>
                        <td>Homer</td>
                    </tr>
                    <tr>
                        <td><a href="#" class="btn btn-dark">Comprar</a></td>
                    </tr>
                </table>
            </a>
            <a href="#"><table id="customers">
                    <tr>
                        <td><img src="_img/homer.jpg"></td>
                    </tr>
                    <tr>
                        <td>Homer</td>
                    </tr>
                    <tr>
                        <td><a href="#" class="btn btn-dark">Comprar</a></td>
                    </tr>
                </table>
            </a>
            <a href="#"><table id="customers">
                    <tr>
                        <td><img src="_img/homer.jpg"></td>
                    </tr>
                    <tr>
                        <td>Homer</td>
                    </tr>
                    <tr>
                        <td><a href="#" class="btn btn-dark">Comprar</a></td>
                    </tr>
                </table>
            </a>
            <a href="#"><table id="customers">
                    <tr>
                        <td><img src="_img/homer.jpg"></td>
                    </tr>
                    <tr>
                        <td>Homer</td>
                    </tr>
                    <tr>
                        <td><a href="#" class="btn btn-dark">Comprar</a></td>
                    </tr>
                </table>
            </a>
            <a href="#"><table id="customers">
                    <tr>
                        <td><img src="_img/homer.jpg"></td>
                    </tr>
                    <tr>
                        <td>Homer</td>
                    </tr>
                    <tr>
                        <td><a href="#" class="btn btn-dark">Comprar</a></td>
                    </tr>
                </table>
            </a>
            <a href="#"><table id="customers">
                    <tr>
                        <td><img src="_img/homer.jpg"></td>
                    </tr>
                    <tr>
                        <td>Homer</td>
                    </tr>
                    <tr>
                        <td><a href="#" class="btn btn-dark">Comprar</a></td>
                    </tr>
                </table>
            </a>
            <a href="#"><table id="customers">
                    <tr>
                        <td><img src="_img/homer.jpg"></td>
                    </tr>
                    <tr>
                        <td>Homer</td>
                    </tr>
                    <tr>
                        <td><a href="##" class="btn btn-dark">Comprar</a></td>
                    </tr>
                </table>
            </a>
        </div>

    </body>
    <%@include file="WEB-INF/jspf/footer.jspf"%>
</html>
