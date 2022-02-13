<%@ page import="entities.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! User user;%>
<%
    user = (User) session.getAttribute("user_logged");
    if (user != null) {
        response.sendRedirect(request.getContextPath() + "/dispatcher");
    }
%>
<html>
<head>
    <title>Login Page</title>
    <style>
        #loginForm {
            padding-top: 300px;
            margin-left: auto;
            margin-right: auto;
            width: 400px;
        }
    </style>
</head>
<body>
    <form action="${pageContext.request.contextPath}/login" method="POST" id="loginForm">
        Enter user_name: <input type="text" name="user_name"/><br/>
        Enter password: <input type="password" name="parola"/><br/>
        <input type="submit" value="Login">
    </form>
</body>
</html>
