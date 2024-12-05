<%@ include file="header.jsp" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>
<html>
    <head>
        <title>Buy products</title>
        <style>
table,th,td{
    border:2px solid;
    border-collapse: collapse;
    border:none;
    align-self: center;
}
td{
    padding: 2px 7px;
    text-align: center;
    font-size:18px;
}
table{
    margin-left: auto;
    margin-right: auto;
    width: 60%;
    border: 1px solid;

}
tr{
    height: 50px;
    border-top: 1px solid;
    display: flex;
    justify-content: left;
    padding:-5px;
}
tr:nth-child(even){
    background-color:rgb(224, 156, 72);
}
tr:nth-child(odd){
    background-color:rgb(250,191,118);
}
button{
    background-color: black;
    border-radius: 3px;
    padding: 10px 10px;
    color:white;
    margin-top: 18px;
    font-size: 20px;
    font-family: 'Tribuchet';
    cursor:pointer;
}
        </style>
    </head>
    <body bgcolor="black">
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "root", "Gowthami@123");

        String sql = "SELECT * FROM sell_item WHERE category='Others'";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();
        
%>
<h1 style="text-align:center;color:white;">Others</h1>
<%
    while(rs.next()){
        %>
        
        <table>
        <tr style="background-color:black;color:white;"><td><h2><%=rs.getString("item_id")%>.  <%=rs.getString("item_name") %></h2></td></tr>
        <tr><td><h3>Category:</h3><td><%=rs.getString("category") %></td></tr>
        <tr><td><h3>Description:<td><%=rs.getString("item_desc") %></h3></td></tr>
        <tr><td><h3>Price(in INR):<td><%=rs.getString("item_price") %></h3></td></tr>
        <tr style="background-color:rgb(59,60,54);color:white;"><td><h3 >--Seller Details--</h3></td></tr>
        <tr><td><h3>Username:<td><%=rs.getString("username") %></h3></td></tr>
        <tr><td><h3>Seller ID:<td><%=rs.getString("selling_id") %></h3></td></tr>
        <tr><td><h3>Email:<td><%=rs.getString("email") %></h3></td></tr>
        <tr><td><h3>Contact no.:<td><%=rs.getString("mobile") %></h3></td></tr>
        <tr><td><h3>Address:<td><%=rs.getString("address") %></h3></td></tr>
        <tr style="display:flex;justify-content: center;"><td>
            <form method="post" action="../add_to_cart.jsp">
                        <input type="hidden" name="item_id" value="<%= rs.getString("item_id") %>">
                        <input type="hidden" name="item_name" value="<%= rs.getString("item_name") %>">
                        <input type="hidden" name="item_price" value="<%= rs.getString("item_price") %>">
                        <input type="hidden" name="item_desc" value="<%= rs.getString("item_desc") %>">
                        <input type="hidden" name="category" value="<%= rs.getString("category") %>">
                        <input type="hidden" name="username" value="<%= rs.getString("username") %>">
                        <input type="hidden" name="selling_id" value="<%= rs.getString("selling_id") %>">
                        <input type="hidden" name="email" value="<%= rs.getString("email") %>">
                        <input type="hidden" name="mobile" value="<%= rs.getString("mobile") %>">
                        <input type="hidden" name="address" value="<%= rs.getString("address") %>">
                        <button type="submit" class="button">Add to Cart</button>
            </form>
            </td>
        </tr>
        <br>
        </table>

        <%
    }
    rs.close();
    %>    
 <%   
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try {
            if (rs != null) rs.close();
            if (pstmt != null) pstmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            out.println("Error closing resources: " + e.getMessage());
        }
    }
%>
    </body>
</html>