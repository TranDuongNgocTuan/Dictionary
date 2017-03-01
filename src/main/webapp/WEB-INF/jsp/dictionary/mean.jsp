<%@ page import="java.io.PrintWriter" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" href="/resources/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="/resources/bootstrap/bootstrap-select.min.css">
    <link rel="stylesheet" href="/resources/bootstrap/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="./resources/jquery/jquery-ui.min.css">
    <link rel="stylesheet" href="/resources/css/mean.css">
    <script src="https://code.jquery.com/jquery-2.2.4.js"></script>
    <script type="text/javascript" src="/resources/bootstrap/bootstrap.js"></script>
    <script type="text/javascript" src="/resources/bootstrap/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="./resources/jquery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="/resources/ajax/search-listword.js"></script>
</head>
<body>

<div class="wapper_bar_search">
    <div class="container">
        <div class="row">
            <div class="col-sm-8 col-md-push-1">
                <div id="imaginary_container">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="bar_search">
                        <div class="col-xs-1 col-sm-1 col-md-1 col-lg-1">
                            <div class="logo"><img src="/resources/picture/booklet.png" width="50px" height="50px">
                            </div>
                        </div>

                        <div class="bar_search_mean">
                            <div class="col-md-3">
                                <select class="selectpicker popup" data-style="btn-primary" style="display: none;">
                                    <option class="items">Tiếng Anh - Tiếng Việt</option>
                                    <option class="items">Tiếng Việt - Tiếng Anh</option>
                                </select>
                            </div>
                            <div class="col-lg-8">
                                <form action="/searchword" method="get">
                                    <div class="input-group stylish-input-group">
                                        <input type="text" class="form-control" placeholder="Search" id="input_search"
                                               name="word">
                                        <span class="input-group-addon">
                                            <button type="submit">
                                                <span class="glyphicon glyphicon-search"></span>
                                            </button>
                                        </span>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <div class="wapper">
            <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8 col-md-offset-1 frame">
                <%
                    String[] line = (String[]) request.getAttribute("mean");
                    if (line[0].indexOf(" /")>-1){
                        if (line[0].indexOf('@')>-1){
                            out.println("<div id=\"word\"><img src=\"/resources/picture/icon-ox3000.png\"/><h2>" + line[0].substring(1, line[0].indexOf(" /")) + "</h2></div>");
                            out.println("<div class=\"pronounce\"><div class=\"phonetic\">" + line[0].substring(line[0].indexOf(" /")) + "</div>" + "<div class=\"sound\">" +
                                    "<i class=\"fa fa-volume-up fa-2x\" aria-hidden=\"true\"></i>" +
                                    "</div></div>");
                        }
                    }
                    else{
                        out.println("<div id=\"word\"><img src=\"/resources/picture/icon-ox3000.png\"/><h2>" + line[0].substring(1) + "</h2></div>");
                    }


                %>

                <div id="word_mean">
                    <%
                        for (int i = 1; i < line.length; i++) {
                    %>

                    <%
                        if (line[i].indexOf('*') != -1)
                            out.println("<div class=\"kind_of_word\"><i class=\"fa fa-plus-circle\" aria-hidden=\"true\"></i>" + line[i].substring(1) + "</div>");
                        if (line[i].indexOf('-') != -1)
                            out.println("<div class=\"mean_word\">" +
                                    "<div class=\"start\"><i class=\"fa fa-star\" aria-hidden=\"true\"></i></div><span>" + line[i].substring(1) + "</span>" +
                                    "</div>");
                        if (line[i].indexOf("=") != -1)
                            out.println("<div class=\"statement\">" +
                                    "<i class=\"fa fa-circle\" aria-hidden=\"true\"></i>" +
                                    "<div class=\"example_statement\">" +
                                    "<div>" + line[i].substring(1, line[i].indexOf("+")) + "</div> " +
                                    "<div class=\"statement_mean\">" + line[i].substring(line[i].indexOf("+")+1) + "</div>" +
                                    "</div>" +
                                    "</div>");
                    %>
                    <% } %>
                </div>

            </div>

            <div class="col-xs-2 col-sm-2 col-md-2 col-lg-2 near_word">
                <div class="list_right_word">

                    <h4 class="list-group-item-heading">Từ gần đó</h4>
                    <ul class="list-group">
                        <c:forEach var="nearWords" items="${wordListNear}">
                            <li class="list_group_item"><a href="/searchword?word=${nearWords}">${nearWords.strWord}</a></li>
                        </c:forEach>

                    </ul>
                </div>
            </div>
            <%--end .col-8--%>
        </div>
        <!-- end .wapper -->
    </div>
</div>

<script type="text/javascript">
    $('.selectpicker').selectpicker({});
</script>
</body>
</html>