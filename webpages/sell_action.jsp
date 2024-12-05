<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ include file="header.jsp" %>

<html>
<head>
    <title>Product Added</title>
</head>
<body>
    <%
        // Get the parameters from the form
        String itemname = request.getParameter("itemname");
        String category = request.getParameter("category");
        String itemdesc = request.getParameter("itemdesc");
        String itempriceStr = request.getParameter("itemprice");        
        String username = request.getParameter("username");
        String sellingid = request.getParameter("sellingid");
        String email = request.getParameter("email");
        String mobileStr = request.getParameter("mobile");
        String address = request.getParameter("address");

        // Check if all fields are filled
        if (itemname != null && !itemname.isEmpty() && 
            sellingid != null && !sellingid.isEmpty() && 
            category != null && !category.isEmpty() && 
            itemdesc != null && !itemdesc.isEmpty() && 
            itempriceStr != null && !itempriceStr.isEmpty() && 
            username != null && !username.isEmpty()&&
            email != null && !email.isEmpty() && 
            mobileStr != null && !mobileStr.isEmpty() &&
            address != null && !address.isEmpty()) {

            Integer itemprice = Integer.valueOf(itempriceStr);
            long mobile = Long.parseLong(mobileStr);
            
            Connection conn = null;
            PreparedStatement pstmt = null;

            try {
                // Load MySQL JDBC Driver
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Connect to the database
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Gowthami@123"); // Update with your password

                // Prepare the SQL query to insert the product
                String sql = "INSERT INTO sell_item (item_name,category, item_desc, item_price, username,selling_id,email, mobile, address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);

                // Set the parameters
                pstmt.setString(1, itemname);
                pstmt.setString(2, category);
                pstmt.setString(3, itemdesc);
                pstmt.setInt(4, itemprice);
                pstmt.setString(5, username);
                pstmt.setString(6, sellingid);
                pstmt.setString(7, email);
                pstmt.setLong(8, mobile);
                pstmt.setString(9, address);

                // Execute the query
                int update = pstmt.executeUpdate();

                // Check if the insertion was successful
                if (update != 0) {
                    %>
                    <br>
                    <table style="background-color: #E3E4FA;" width="30%" border="1">
                        <tr><th>Product is added successfully into the database.</th></tr>
                    </table>
                    <%
                } else {
                    out.println("Failed to add product.");
                }
            } catch (ClassNotFoundException e) {
                out.println("JDBC Driver not found: " + e.getMessage());
                
            } catch (SQLException e) {
                out.println("SQL Error: " + e.getMessage());
                
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
