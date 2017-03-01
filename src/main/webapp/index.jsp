<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="./resources/bootstrap/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="./resources/bootstrap/bootstrap-select.min.css">
    <link rel="stylesheet" type="text/css" href="./resources/jquery/jquery-ui.min.css">
    <link rel="stylesheet" href="./resources/css/index.css">
    <script type="text/javascript" src="./resources/jquery/jquery.js"></script>
    <script type="text/javascript" src="./resources/bootstrap/bootstrap.js"></script>
    <script type="text/javascript" src="./resources/bootstrap/bootstrap-select.min.js"></script>
    <script type="text/javascript" src="./resources/jquery/jquery-ui.min.js"></script>
    <script type="text/javascript" src="./resources/ajax/search-listword.js"></script>
</head>
<body>
<div class="container">
    <div class="row">
        <div class="col-sm-8 col-sm-offset-2">
            <div id="imaginary_container">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 logo_title text-center">
                    <div class="logo"><img src="/resources/picture/booklet.png" width="100px" height="100px"></div>
                    <div class="title pull-left">SEARCH DICTIONARY</div>
                </div>

                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12" id="bar_search">
                    <div class="col-md-3">
                        <select class="selectpicker popup" data-style="btn-primary" style="display: none;">
                            <option class="items">Tiếng Anh - Tiếng Việt</option>
                            <option class="items">Tiếng Việt - Tiếng Anh</option>
                        </select>
                    </div>
                    <div class="col-lg-9">
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
</body>
</html>