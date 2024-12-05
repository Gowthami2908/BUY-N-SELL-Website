<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<html>
    <head>
        <title>Sign up</title>
    </head>
    <body>
        <%
            String email = request.getParameter("email");
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            if (email != null && !email.isEmpty() && 
                username != null && !username.isEmpty() && 
                password != null && !password.isEmpty()) {
                
                Connection conn = null;
                PreparedStatement pstmt = null;

                try {
                    
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Gowthami@123");

                    String sql = "INSERT INTO user_signup(user_email,user_username,user_password) VALUES (?, ?, ?)";
                    pstmt = conn.prepareStatement(sql);

                    pstmt.setString(1, email);
                    pstmt.setString(2, username);
                    pstmt.setString(3, password);

                    int update = pstmt.executeUpdate();

                    if (update != 0) {
                        %>
                        <br>
                        <TABLE style="background-color: #E3E4FA;" WIDTH="30%" border="1">
                            <tr><th>You have Registered Successfully! Click here to login.<a href="signin.html" >Sign in</th></tr>
                        </table>
                        <%
                    } else {
                        out.println("Failed to insert data.");
                    }
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                } finally {
                    try {
                        if (pstmt != null) pstmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        out.println("Error closing resources: " + e.getMessage());
                    }
                }
            } else {
                out.println("Please fill in all fields.");
            }
        %>
    </body>
</html>