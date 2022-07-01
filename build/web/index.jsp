<%-- 
    Document   : index
    Created on : Jun 27, 2022, 3:33:18 PM
    Author     : ADMIN
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="java.util.List"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDao"%>
<%@page import="model.User"%>
<%@page import="connection.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    User auth = (User) request.getSession().getAttribute("auth");
    if (auth != null) {
        request.setAttribute("auth", auth);
    }
    ProductDao pd = new ProductDao(DbCon.getConnection());
    List<Product> products = pd.getAllProducts();

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


            <div class="card-header my-3">
                <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-primary my-2 my-sm-0" type="submit">Search</button>
                </form>
            </div>
            <div class="row">

                <%if (!products.isEmpty()) {
                        for (Product p : products) {%>
                <div class="col-md-3">
                    <div class="card w-100" style="width: 18rem;">
                        <img class="card-img-top" src="product-images/<%= p.getImage()%>" alt="Card image cap">
                        <div class="card-body">
                            <h5 class="card-title"><%= p.getName()%></h5>
                            <h6 class="price">Price: <span class="text-danger"> <i class="fa-solid fa-dollar-sign"></i><%= p.getPrice()%></span></h6>
                            <h6 class="category">Category: <%= p.getCategory()%></h6>
                            <div class="mt-3 d-flex justify-content-between">
                                <a href="add-to-cart?id=<%= p.getId()%>" class="btn btn-success "><i class="fa-solid fa-square-plus mr-sm-3"></i>Add</a>
                                <a href="order-now?quantity=1&id=<%= p.getId()%>" class="btn btn-primary">Buy Now</a>
                            </div>
                            <p class="card-text">buy it, customers!</p>

                        </div>
                    </div>
                </div>
                <% }
                    }
                %>


            </div>
        </div>
                   
        <%@include file="includes/footer.jsp" %>
         <nav aria-label="...">
            <ul class="pagination" style="margin:20px 40%;">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Previous</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item active">
                    <a class="page-link" href="#">2 <span class="sr-only">(current)</span></a>
                </li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                    <a class="page-link" href="#">Next</a>
                </li>
            </ul>
        </nav>

        <%@include file="includes/feuter.jsp" %>


    </body>
</html>
