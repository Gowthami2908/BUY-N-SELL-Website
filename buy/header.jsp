<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>

<%
    session = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("session_expired.jsp");
        return;
    }
%>

<style>
    .logout {
        position: fixed;
        top: 20px;
        right: 20px;
        background-color: rgb(245,163,62);
        color: #000;
        padding: 10px;
        border-radius: 5px;
        cursor: pointer;
    }
    .logout:hover {
        background-color: #E6BE8A;
    }
</style>

<div class="logout" onclick="location.href='logout.jsp'">Logout</div>
