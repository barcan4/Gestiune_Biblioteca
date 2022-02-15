<%@ page import="entities.Carte" %>
<%@ page import="java.util.List" %>
<%@ page import="entities.User" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! User user; %>
<%
    user = (User) session.getAttribute("user_logged");
    String user_name = (String) session.getAttribute("user_name");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
%>

<% List<Carte> carteList = (List<Carte>) session.getAttribute("carteList");%>
<html>
<head>
    <title>Carti Page</title>
    <link rel="stylesheet" href="styles.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body style="margin: 17px;">
<p> Autentificat ca <i><%= user_name %> </i></p>
<div class="nav-btns">
<form style="margin-right: 10px" action="${pageContext.request.contextPath}/dispatcher" method="POST">
    <input type="hidden" name="action" value="goToInc">
    <input class="button-inchireaza" type="submit" value="Inchirierile tale">
</form>


<form action="${pageContext.request.contextPath}/login" method="POST">
    <input type="hidden" name="action" value="logout">
    <input class=" button-inchireaza" type="submit" value="Log out">
</form>

</div>
<h1> Carti disponibile </h1>
<div class="cards-container">
<table>

    <%
        for (Carte c : carteList) {
    %>

    <tr>
        <form action="${pageContext.request.contextPath}/dispatcher" method="POST">
            <input type="hidden" name="action" value="rent">
            <input type="hidden" name="cID" value="<%=c.getcID()%>" readonly>
            <td><input type="hidden" name="titlu" value="<%=c.getTitlu()%>" readonly></td>
            <td><input type="hidden" name="autor" value="<%=c.getAutor()%>" readonly></td>
            <td><input type="hidden" name="editura" value="<%=c.getEditura()%>" readonly></td>
            <td><input type="hidden" name="anPub" value="<%=c.getAnPublicatie()%>" readonly></td>
<%--            <td><input type="submit" name="rentBtn" value="Inchireaza" ></td>--%>
            <div class="card">
                <div class="card-body">
                    <h4 class="card-title"><%=c.getTitlu()%></h4>
                    <p class="card-text"><%=c.getAutor()%></p>
                    <p class="card-text"><%=c.getEditura()%>, <%=c.getAnPublicatie()%></p>
                    <input class="card-link button-inchireaza" type="submit" name="rentBtn" value="Inchireaza" >
<%--                    <a href="#" class="card-link">Another link</a>--%>
                </div>
            </div>
        </form>
    </tr>
    <%
        }
    %>
    </div>
</table>




</body>
</html>
