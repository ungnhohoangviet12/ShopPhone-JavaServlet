<%-- 
    Document   : index
    Created on : Jun 27, 2022, 3:33:18 PM
    Author     : ADMIN
--%>

<%@page import="java.util.List"%>
<%@page import="model.Order"%>
<%@page import="dao.OrderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.Cart"%>
<%@page import="model.User"%>
<%@page import="connection.DbCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DecimalFormat dcf = new DecimalFormat("#.##");
    request.setAttribute("dcf", dcf);
    User auth = (User) request.getSession().getAttribute("auth");
    List<Order> orders = null;
    if (auth != null) {
        request.setAttribute("auth", auth);
         orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
    } else {
//        response.sendRedirect("login.jsp");
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
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			<%
                            if(orders != null){
                             for(Order o:orders){%>
                             <tr>
                                <td><%= o.getDate()%> </td>
                                <td><%= o.getName()%> </td>
                                <td><%= o.getCategory()%> </td>
                                <td><%= o.getQunatity()%> </td>
                                <td><%= o.getPrice()%> </td>
                                <td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%= o.getOrderId()%>">Cancel</a></td>
                                
                             </tr>
                                   <%}
                            }
                        %>
			</tbody>
		</table>
	</div>

        <%@include file="includes/footer.jsp" %>

    </body>
</html>
