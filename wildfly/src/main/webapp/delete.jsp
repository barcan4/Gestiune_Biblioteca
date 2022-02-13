<%@ page import="domain.Instrument" %>
<%@ page import="controller.InstrumentController" %><%--
  Created by IntelliJ IDEA.
  User: Barcoaie
  Date: 12.12.2021
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    InstrumentController instrumentController = (InstrumentController) session.getAttribute("insController");
    int index = Integer.parseInt(request.getParameter("index")) - 1;
    Instrument ins = instrumentController.getAll().get(index);
%>
<html>
<head>
    <title>Delete an Instrument</title>
</head>
<body>
<form method='POST' action='DispatcherController/'>
    <input type='hidden' name='action' value='deleteIns'>
    <input type='hidden' name='id' value='<%=ins.getId()%>'>
    Esti sigur ca doresti sa stergi acea intrare?<br>
    <input type="submit" name="deleteBtn" value="Delete"><br>
</form>
<form method="GET" action="DispatcherController/">
    <input type='hidden' name='action' value='cancelDelete'>
    <input type='submit' value='Anuleaza'>
</form>
</body>
</html>
