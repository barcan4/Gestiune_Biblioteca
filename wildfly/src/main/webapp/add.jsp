<%--
  Created by IntelliJ IDEA.
  User: Barcoaie
  Date: 12.12.2021
  Time: 16:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add an Instrument</title>
</head>
<body>
<form method="GET" action="DispatcherController/">
    <input type="hidden" name="action" value="addIns">
    Name of the Instrument: <input id="addName" type='text' name='nume'><br>
    Type of the Instrument: <input id="addType" type='text' name='tip'><br>
    Price of the Instrument: <input id="addPrice" type='text' name='pret'><br>
    <input type="submit" name="addBtn" value="Adauga">
</form>
</body>
</html>
