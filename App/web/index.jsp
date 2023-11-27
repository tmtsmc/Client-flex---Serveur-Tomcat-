<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="bean.Bean" %>
<html>
    <head>
      <title>Android GCM Broadcast</title>
    </head>
    <body>
<%
Bean bean = new Bean();
bean.setStr("HelloWorld");
%>
        <h2><%= bean.getStr()%></h2>
<% if (session.getAttribute("connected") != null && ((String) session.getAttribute("connected")).matches("true")) {%>
    Welcome <%=session.getAttribute("userName")%><br />
    <a href="logout.jsp">Logout</a>
<%} else {%>
<form method="POST" action="login.jsp">
    <table>
        <tr>
            <td colspan="2">Login :</td>
        </tr>
        <tr>
            <td>Name :</td>
            <td><input type="text" name="userName" /></td>
        </tr>
        <tr>
            <td>Password :</td>
            <td><input type="obviouslyNotMyPassword" name="userPassword" /></td>
        </tr>
        <tr>
            <td colspan="2"><input type="submit" value="Login" /></td>
        </tr>
    </table>
</form>
<%}%>
</body>
</html>