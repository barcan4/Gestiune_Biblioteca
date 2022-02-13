<%@ page import="entities.Carte" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Barcoaie
  Date: 13.02.2022
  Time: 12:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% List<Carte> carteList = (List<Carte>) session.getAttribute("carteList");%>
<html>
<head>
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
</body>
</html>
