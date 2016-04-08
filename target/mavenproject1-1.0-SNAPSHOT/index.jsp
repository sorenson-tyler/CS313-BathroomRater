<%-- 
    Document   : index
    Created on : Mar 19, 2016, 11:27:12 PM
    Author     : Tyler Sorenson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta name="theme-color" content="#74828f">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
        <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/css/toastr.css" rel="stylesheet"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.0.1/js/toastr.js"></script>
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <style>
            * {
                border-radius: 0 !important;
            }
            body {
                padding-top: 10%;
                background-color: #ffffff; /* White */
            }
            .jumbotron { 
                background-color: #74828f; /* Blue */
            }
            form {
                margin-left: 5%;
            }
            .btn {
                width: 100px;
            }
            #create {
                margin-top: 40px;
            }
</style>
    </head>
    <body>
        <%  if(request.getParameter("Error") != null) {
                String error = request.getParameter("Error"); 
                if(error.equals("user")) {
                    %>
                    <script>toastr.error('Invalid email address!');</script>
                    <%
                }
                else if (error.equals("pass")) {
                    %>
                    <script>toastr.error('Invalid password!');</script>
                    <%
                }
            }
        %>
        <div>
            <div class="jumbotron text-center">
                <h1>Bathroom Rater</h1>

                <form id="login" action="Authenticate" method="post" role="form" class="form-inline"
                      data-fv-framework="bootstrap"
                        data-fv-message="This value is not valid"
                        data-fv-icon-valid="glyphicon glyphicon-ok"
                        data-fv-icon-invalid="glyphicon glyphicon-remove"
                        data-fv-icon-validating="glyphicon glyphicon-refresh">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="email" name="username" class="form-control"
                                    data-fv-notempty="true"
                                    data-fv-notempty-message="The username is required and cannot be empty"
                                   data-fv-emailaddress="true"
                                   data-fv-emailaddress-message="The input is not a valid email address"
                                    placeholder="Enter email">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">          
                            <input type="password" name="password" class="form-control"
                                   data-fv-notempty="true"
                                    data-fv-notempty-message="The password is required and cannot be empty"
                                    data-fv-different="true"
                                    data-fv-different-field="username"
                                    data-fv-different-message="The password cannot be the same as username"
                            placeholder="Enter password">
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-12">
                            <div class="checkbox">
                                <label><input type="checkbox"> Remember me</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">        
                        <div class="col-sm-offset-2 col-sm-12">
                            <button type="submit" class="btn btn-default">Submit</button>
                        </div>
                    </div>
                </form>
                <script>
                    $(document).ready(function() {
                        $('#login').formValidation();
                    });
                    function addUser() {
                        window.location.href = "addUser.jsp";
                    }
                </script>
                </div>
        </div>
    </body>
</html>

