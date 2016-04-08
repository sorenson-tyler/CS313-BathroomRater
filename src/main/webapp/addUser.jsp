<%-- 
    Document   : addUser
    Created on : Mar 20, 2016, 12:07:18 AM
    Author     : Tyler Sorenson
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
        <title>Add user</title>
    </head>
    <body>
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
                    <div class="col-sm-12">          
                        <input type="password" name="password2" class="form-control"
                               data-fv-notempty="true"
                                data-fv-notempty-message="The password is required and cannot be empty"
                                data-fv-different="true"
                                data-fv-different-field="username"
                                data-fv-different-message="The password cannot be the same as username"
                        placeholder="Renter password">
                    </div>
                </div>
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-12">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
