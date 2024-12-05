<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="header.jsp" %>
<%
    String itemId = request.getParameter("item_id");
    String itemName = request.getParameter("item_name");
    String category = request.getParameter("category");
    String itemDesc = request.getParameter("item_desc");
    String itemPrice = request.getParameter("item_price");
    String sellerUsername = request.getParameter("username");
    String sellerEmail = request.getParameter("email");
    String sellerMobile = request.getParameter("mobile");
    String sellerAddress = request.getParameter("address");

    session = request.getSession(false);
    if (session != null && session.getAttribute("username") != null) {
        String username = (String) session.getAttribute("username");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Gowthami@123");

            String sql = "INSERT INTO cart (username, item_id, item_name, category, item_desc, item_price, seller_username, seller_email, seller_mobile, seller_address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setInt(2, Integer.parseInt(itemId));
            pstmt.setString(3, itemName);
            pstmt.setString(4, category);
            pstmt.setString(5, itemDesc);
            pstmt.setString(6, itemPrice);
            pstmt.setString(7, sellerUsername);
            pstmt.setString(8, sellerEmail);
            pstmt.setString(9, sellerMobile);
            pstmt.setString(10, sellerAddress);

            int rows = pstmt.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("cart.jsp");
            } else {
                out.println("Failed to add item to cart.");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    } else {
        response.sendRedirect("signup.html");
    }
%>
