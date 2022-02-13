<%@ page import="controller.InstrumentController" %>
<%@ page import="repo.Repo" %>
<%@ page import="domain.Instrument" %><%--
  Created by IntelliJ IDEA.
  User: Barcoaie
  Date: 29.11.2021
  Time: 10:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! final InstrumentController instrumentController = new InstrumentController(new Repo());%>
<%
  if (session.getAttribute("insController") == null) {
    session.setAttribute("insController", instrumentController);
  }
%>
<!DOCTYPE html>
<html>
  <head>
    <title>View Page</title>
    <style>
          table, th, td {
              border: 1px solid black;
          }
          table {
              width: 10%;
              margin-left: 100px;
              margin-bottom: 15px;
          }
          #add {
              margin-left: 100px;
          }
    </style>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="js/utils.js"></script>
  </head>
  <body>
  <table>
    <tr>
      <th>Name</th>
      <th>Type</th>
      <th>Price</th>
    </tr>
    <%
      for (Instrument ins : instrumentController.getAll()) {
        %>
      <tr>
        <form action="DispatcherController/" method="GET">
          <input type="hidden" name="action" value="update">
          <input type="hidden" name="index" value="<%=ins.getId()%>">
          <td><input type="text" name="name" value="<%=ins.getName()%>" readonly></td>
          <td><input type="text" name="type" value="<%=ins.getType()%>" readonly></td>
          <td><input type="text" name="price" value="<%=ins.getPrice()%>" readonly></td>
          <td><input type="submit" name="updateBtn" value="Update"></td>
        </form>
        <form action="DispatcherController/" method="GET">
          <input type="hidden" name="action" value="delete">
          <input type="hidden" name="index" value="<%=ins.getId()%>">
          <td><input type="submit" name="deleteBtn" value="Delete"></td>
        </form>
      </tr>
    <%
      }
    %>
  </table>
  <button id="add">Add an Instrument</button>
  <script>
    $("#add").on("click", goAdd);
  </script>
  </body>
</html>
