<%@ page import="entities.Carte" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! User user;%>
<%
    user = (User) session.getAttribute("user_logged");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>

<% List<Carte> carteList = (List<Carte>) session.getAttribute("carteList");%>
<html>
<head>
    <title>Carti Page</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<table>
    <tr>
        <th>Titlu</th>
        <th>Autor</th>
        <th>Editura</th>
        <th>An Publicatie</th>
    </tr>
    <%
        for (Carte c : carteList) {
    %>
    <tr>
        <form action="${pageContext.request.contextPath}/dispatcher" method="POST">
            <input type="hidden" name="action" value="rent">
            <input type="hidden" name="cID" value="<%=c.getcID()%>" readonly>
            <td><input type="text" name="titlu" value="<%=c.getTitlu()%>" readonly></td>
            <td><input type="text" name="autor" value="<%=c.getAutor()%>" readonly></td>
            <td><input type="text" name="editura" value="<%=c.getEditura()%>" readonly></td>
            <td><input type="text" name="anPub" value="<%=c.getAnPublicatie()%>" readonly></td>
            <td><input type="submit" name="rentBtn" value="Inchireaza" ></td>
        </form>
    </tr>
    <%
        }
    %>
</table>

<br/>

<form action="${pageContext.request.contextPath}/dispatcher" method="POST">
    <input type="hidden" name="action" value="goToInc">
    <input type="submit" value="Inchirierile tale">
</form>

<br/>
<br/>

<form action="${pageContext.request.contextPath}/login" method="POST">
    <input type="hidden" name="action" value="logout">
    <input type="submit" value="Log out">
</form>

</body>
</html>
