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
    <link rel="stylesheet" href="styles.css">
    <title>Carti Page</title>
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
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="cID" value="<%=c.getcID()%>">
                <td><input type="text" name="titlu" value="<%=c.getTitlu()%>" ></td>
                <td><input type="text" name="autor" value="<%=c.getAutor()%>" ></td>
                <td><input type="text" name="editura" value="<%=c.getEditura()%>" ></td>
                <td><input type="text" name="anPub" value="<%=c.getAnPublicatie()%>" ></td>
                <td><input type="submit" name="updateBtn" value="Actualizeaza"></td>
            </form>

            <form action="${pageContext.request.contextPath}/dispatcher" method="POST">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="cID" value="<%=c.getcID()%>">
                <td><input type="submit" name="deleteBtn" value="Sterge"></td>
            </form>
        </tr>
    <%
        }
    %>
</table>


<form action="${pageContext.request.contextPath}/dispatcher" method="POST">
    <input type="hidden" name="action" value="add">
    Titlu: <input type="text" name="titlu">
    Autor: <input type="text" name="autor">
    Editura: <input type="text" name="editura">
    An publicatie: <input type="text" name="anPub">
    <input type="submit" value="Adauga">
</form>

<br/>
<br/>

<form action="${pageContext.request.contextPath}/login" method="POST">
    <input type="hidden" name="action" value="logout">
    <input type="submit" value="Log out">
</form>
</body>
</html>
