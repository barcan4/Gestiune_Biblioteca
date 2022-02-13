<%@ page import="domain.Instrument" %>
<%@ page import="controller.InstrumentController" %><%--
  Created by IntelliJ IDEA.
  User: Barcoaie
  Date: 12.12.2021
  Time: 19:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! InstrumentController instrumentController;%>
<%
    instrumentController = (InstrumentController) session.getAttribute("insController");
    int index = Integer.parseInt(request.getParameter("index")) - 1;
    Instrument ins = instrumentController.getAll().get(index);
%>
<html>
<head>
    <title>Update an Instrument</title>
</head>
<body>
<form method="POST" action="DispatcherController/">
    <input type="hidden" name="action" value="updateIns">
    <input type="hidden" name="id" value="<%=ins.getId()%>">
    Numele instrumentului: <input type="text" name="nume" value="<%=ins.getName()%>"><br>
    Tipul instrumentului: <input type="text" name="tip" value="<%=ins.getType()%>"><br>
    Pretul instrumentului: <input type="text" name="pret" value="<%=ins.getPrice()%>"><br>
    <input type="submit" value="Actualizeaza">
</form>
</body>
</html>
