<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="index.jsp"><h1 class="text-success font-italic">Shop Phone</h1></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="index.jsp"><i class="fa-solid fa-house mr-sm-2"></i>Home</a>
                </li>
                <li class="nav-item"><a class="nav-link" href="cart.jsp"><i class="fa-solid fa-cart-shopping mr-sm-2"></i>Cart<span class="badge badge-danger">${ cart_list.size()}</span></a></li>


                <%
                            if (auth != null) {%>
                
                <li class="nav-item"><a class="nav-link" href="orders.jsp"><i class="fa-solid fa-hands-holding-diamond"></i>Orders</a></li>
                <li class="nav-item"><a class="nav-link" href="log-out"><i class="fa-solid fa-right-from-bracket mr-sm-2"></i>Logout</a></li>
                    <%} else {%>
                <li class="nav-item"><a class="nav-link" href="login.jsp">Login</a></li>
                    <% }

                    %>

            </ul>

        </div>
    </div>
</nav>      