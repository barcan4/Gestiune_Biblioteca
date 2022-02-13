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
            <td><input type="hidden" name="cID" value="<%=c.getcID()%>"></td>
            <td><input type="text" name="cID" value="<%=c.getTitlu()%>" readonly></td>
            <td><input type="text" name="cID" value="<%=c.getAutor()%>" readonly></td>
            <td><input type="text" name="cID" value="<%=c.getEditura()%>" readonly></td>
            <td><input type="text" name="cID" value="<%=c.getAnPublicatie()%>" readonly></td>
        </tr>
    <%
        }
    %>
</table>
</body>
</html>
