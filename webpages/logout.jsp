<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.*" %>

<%
    session = request.getSession(false);
    if (session != null) {
        session.invalidate();
    }
    response.sendRedirect("signin.html");
%>
