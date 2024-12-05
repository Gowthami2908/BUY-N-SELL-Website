<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<%@ include file="header.jsp" %>
<%
    String id = request.getParameter("id");

    session = request.getSession(false);
    if (session != null && session.getAttribute("username") != null) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Gowthami@123");

            String sql = "DELETE FROM cart WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(id));
            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                response.sendRedirect("cart.jsp");
            } else {
                out.println("Failed to remove item from cart.");
            }
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        }
    } else {
        response.sendRedirect("signin.html");
    }
%>
