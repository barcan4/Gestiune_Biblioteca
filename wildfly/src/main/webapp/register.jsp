<%--
  Created by IntelliJ IDEA.
  User: Barcoaie
  Date: 15.02.2022
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Inregistrare Page</title>
</head>
<body>
<script>
  function validatePass(event) {
    var pass = document.getElementById("pass").value
    var passAgain = document.getElementById("passAgain").value

    if (pass !== passAgain) {
      event.preventDefault()
    }
  }
</script>
  <form action="${pageContext.request.contextPath}/login" method="POST" onsubmit="validatePass()">
    <input type="hidden" name="action" value="addUser"/>
    <input type="text" name="nume" required/>
    <input type="text" name="prenume" required/>
    <input type="text" name="user_nameReg" required/>
    <input type="password" name="parolaReg" id="pass" required/>
    <input type="password" name="parolaAgain" id="passAgain" required/>
    <input type="submit" name="registerBtn" value="Register">
  </form>
  <form action="${pageContext.request.contextPath}/login" method="GET">
    <input type="hidden" name="action" value="backLogin">
    <input type="submit" name="backBtn" value="Back to Login">
  </form>
</body>
</html>
