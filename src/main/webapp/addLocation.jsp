<%-- 
    Document   : addLocation
    Created on : Mar 13, 2016, 3:23:35 PM
    Author     : Tyler Sorenson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="theme-color" content="#74828f">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="stars.css">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Add Location</title>
                <style>
                    * {
                        border-radius: 0 !important;
                    }
                    body {
                        background-color: #ffffff; /* Orange */
                    }
                    .jumbotron { 
                        background-color: #74828f; /* Orange */
                    }
                    form {
                        margin-left: 15%;
                        margin-right: 15%;
                    }
</style>
    </head>
    <body>
        <div>
            <div class="jumbotron text-center">
                <h1>Add Location</h1>
            </div>
            <form method="post" action="SaveRating" role="form" class="form-horizontal">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="name">Location Name: </label>
                    <div class="col-sm-10">
                        <input type="text" placeholder="Location name" name="name" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="rating">Please rate: </label>
                        <div class="col-sm-10">
                            <fieldset class="rating">
                                <input type="radio" class="form-control" id="star5" name="rating" value="5" /><label for="star5" title="Rocks!">5 stars</label>
                                <input type="radio" class="form-control" id="star4" name="rating" value="4" /><label for="star4" title="Pretty good">4 stars</label>
                                <input type="radio" class="form-control" id="star3" name="rating" value="3" /><label for="star3" title="Meh">3 stars</label>
                                <input type="radio" class="form-control" id="star2" name="rating" value="2" /><label for="star2" title="Kinda bad">2 stars</label>
                                <input type="radio" class="form-control" id="star1" name="rating" value="1" /><label for="star1" title="Sucks big time">1 star</label>
                            </fieldset>
                        </div>
                </div>
                <input type="hidden" name="location" value="<%= request.getParameter("Location") %>">
                <div class="form-group">
                    <div class="col-sm-10">
                        <input type="submit" class="btn btn-default" text="Add"/>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
