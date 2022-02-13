<%@ page import="entities.User" %>
<%@ page import="entities.Inchirieri" %>
<%@ page import="java.util.List" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! User user;%>
<%
    user = (User) session.getAttribute("user_logged");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>
<% List<Inchirieri> incList = (List<Inchirieri>) session.getAttribute("incList");%>
<html>
<head>
    <title>Inchirieri Page</title>
</head>
<body>
>
<table>
    <tr>
        <th>Titlu Carte</th>
        <th>Data Inchiriata</th>
    </tr>
    <%
        for (Inchirieri inc : incList) {
            if (inc.getDateReturned().equals("") && inc.getUser().getuID() == user.getuID()) {
    %>
    <tr>
        <form action="${pageContext.request.contextPath}/dispatcher" method="POST">
            <input type="hidden" name="action" value="return">
            <input type="hidden" name="cID" value="<%=inc.getCarte().getcID()%>" readonly>
            <td><input type="text" name="titlu" value="<%=inc.getCarte().getTitlu()%>" readonly></td>
            <td><input type="text" name="dataInc" value="<%=inc.getDateRent()%>" readonly></td>
            <td><input type="submit" name="returnBtn" value="Returneaza" ></td>
        </form>
    </tr>
    <%
            }
        }
    %>
</table>

<form action="${pageContext.request.contextPath}/dispatcher" method="POST">
    <input type="hidden" name="action" value="goBack">
    <input type="submit" value="Inapoi la carti">
</form>
</body>
</html>
