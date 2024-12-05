<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Cart</title>
    <style>
        body {
            font-family: 'Trebuchet MS';
            background-color: black;
            color: white;
            padding-top: 100px;
        }
        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
            padding: 20px;
        }
        .card {
            background-color: rgb(59, 60, 54);
            border: 1px solid #FFD700;
            border-radius: 8px;
            width: 300px;
            padding: 15px;
            box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
            transition: 0.3s;
        }
        .card:hover {
            box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
        }
        .card h3 {
            color: rgb(245,163,62);
        }
        .card p {
            color: white;
        }
        .card .button {
            background-color: rgb(245, 163, 62);
            color: black;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            border-radius: 4px;
            margin-top: 10px;
            transition: background-color 0.3s ease;
        }
        .card .button:hover {
            background-color: #e2a453;
        }
    .nav {
            width: 100%;
            padding: 35px 0;
            margin: auto;
            align-items: end;
            display: flex;
            justify-content: space-between;
            background-image: linear-gradient(to bottom right, rgb(224, 156, 72), rgb(224, 156, 72));
            position: fixed;
            top: 0;
            z-index: 1000;
            height: 10px;
        }
        .nav ul li {
            list-style: none;
            display: inline-block;
            margin: -15px 15px;
            position: relative;
            margin-right: 40px;
        }
        .nav ul li a {
            text-decoration: none;
            text-shadow: black;
            font-size: 22px;
            font-family: 'Segoe Script', sans-serif;
            font-weight: bolder;
            color: black;
            text-transform: uppercase;
        }
        .nav ul li::after {
            content: '';
            height: 3px;
            width: 0;
            background-color: rgb(255, 255, 255);
            position: absolute;
            left: 0;
            bottom: -3px;
            transition: 0.5s;
        }
        .nav ul li:hover::after {
            width: 100%;
        }
        .nav ul {
            margin-top: 70px;
            margin-right: 80px;
            margin-bottom: -10px;
        }
    </style>
</head>
<body>
    <div class="nav">
        <h1 style="font-size: 40px; color: black; font-family: 'Segoe Script', sans-serif; margin-bottom: -30px; margin-left: 10px;">Buy N Sell</h1>
        <ul>
            <li><a href="index.html">Home</a></li>
            <li><a href="buy.jsp">Buy</a></li>
            <li><a href="sell.jsp">Sell</a></li>
            <li><a href="cart.jsp">Cart</a></li>
            <li><a href="#">Contact</a></li>
        </ul>
    </div>
    <h1 style="text-align: center;">My Cart</h1>
    <div class="container">
        <%
            session = request.getSession(false);
            if (session != null && session.getAttribute("username") != null) {
                String username = (String) session.getAttribute("username");
                Connection conn = null;
                PreparedStatement pstmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Gowthami@123");

                    String sql = "SELECT * FROM cart WHERE username = ?";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, username);
                    rs = pstmt.executeQuery();

                    while (rs.next()) {
                        %>
                        <div class="card">
                            <h3><%= rs.getString("item_name") %></h3>
                            <p><strong>Category:</strong> <%= rs.getString("category") %></p>
                            <p><strong>Description:</strong> <%= rs.getString("item_desc") %></p>
                            <p><strong>Price (in INR):</strong> <%= rs.getString("item_price") %></p>
                            <p><strong>Seller:</strong> <%= rs.getString("seller_username") %> (ID: <%= rs.getInt("item_id") %>)</p>
                            <p><strong>Email:</strong> <%= rs.getString("seller_email") %></p>
                            <p><strong>Contact:</strong> <%= rs.getString("seller_mobile") %></p>
                            <p><strong>Address:</strong> <%= rs.getString("seller_address") %></p>
                            <a href="remove_from_cart.jsp?id=<%= rs.getInt("id") %>" class="button">Remove from Cart</a>
                        </div>
                        <%
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            } else {
                response.sendRedirect("signin.html");
            }
        %>
    </div>
</body>
</html>
