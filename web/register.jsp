<%-- 
    Document   : index
    Created on : Jun 27, 2022, 3:33:18 PM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
  User auth = (User)  request.getSession().getAttribute("auth");
  if(auth!=null){
        response.sendRedirect("index.jsp");
    }
       ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
    if (cart_list != null) {
        request.setAttribute("cart_list", cart_list);
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="includes/head.jsp" %>
    </head>
    <body>
        <%@include file="includes/navbar.jsp" %>
        <div class="container">
            <div class="card w-50 mx-auto my-5">
                <div class="card-header text-center">User Register</div>
                <div class="card-body">
                    <form action="user-login" method="post">
                        <div class="form-group">
                            <label>User Name</label>
                            <input type="text" class="form-control" name="userName" placeholder="Enter Your Name" required/>
                        </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <input type="email" class="form-control" name="email" placeholder="Enter Your Email" required/>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="password" placeholder="********" required/>
                        </div>
                        <div class="form-group">
                            <label>Password</label>
                            <input type="password" class="form-control" name="confirmPassword" placeholder="********" required/>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary btn-lg btn-block">Register</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
