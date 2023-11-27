<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    final String password = "obviouslyNotMyPassword";
    final String name = "admin";

    String userName = request.getParameter("userName");
    String userPassword = request.getParameter("userPassword");

    if (userName != null && userPassword != null) {
        if (userName.matches(name) && userPassword.matches(password)) {
            session.setAttribute("userName", userName);
            session.setAttribute("connected", "true");
        }
    }

    response.sendRedirect("HelloWorld");
%>