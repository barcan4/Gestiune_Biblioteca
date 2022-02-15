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
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="inchirieri.scss">
    <title>Inchirieri Page</title>
</head>
<body>
<div class="nav-btns">
<form action="${pageContext.request.contextPath}/dispatcher" method="POST">
    <input type="hidden" name="action" value="goBack">
    <input class="button-inchireaza" type="submit" value="Inapoi la carti">
</form>
</div>
<h1> Lista cartiilor imprumutate de tine</h1>
<div class="container">
<div class="table">
    <div class="table-header">
        <div class="header__item">Titlu</div>
        <div class="header__item">Data inchirierii</div>
        <div class="header__item">Returneaza</div>
    </div>

    <div class="table-content">
    <%
        for (Inchirieri inc : incList) {
            if (inc.getDateReturned().equals("") && inc.getUser().getuID() == user.getuID()) {
    %>
<%--    <tr>--%>
        <form action="${pageContext.request.contextPath}/dispatcher" method="POST">
            <div class="table-row">
                <div class="table-data"><%=inc.getCarte().getTitlu()%></div>
                <div class="table-data"><%=inc.getDateRent()%></div>
                <div class="table-data"><input class="button-inchireaza" type="submit" name="returnBtn" value="Returneaza"></div>
            </div>

            <input type="hidden" name="action" value="return">
            <input type="hidden" name="cID" value="<%=inc.getCarte().getcID()%>" readonly>
            <td><input type="hidden" name="titlu" value="<%=inc.getCarte().getTitlu()%>" readonly></td>
            <td><input type="hidden" name="dataInc" value="<%=inc.getDateRent()%>" readonly></td>
            <td></td>
        </form>
<%--    </tr>--%>
    <%
            }
        }
    %>
    </div>
</div>
</div>

</body>
</html>
