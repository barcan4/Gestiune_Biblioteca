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
  function validatePass() {
    let pass = document.forms["loginForm"]["parolaReg"].value;
    let passAgain = document.forms["loginForm"]["parolaAgain"].value;
    let err = document.getElementById("error");
    err.innerHTML = "";

    if (pass !== passAgain) {
      err.style.color = "red";
      err.innerHTML = "Parola repetata nu e identica!";
      return false;
    }
  }
</script>
  <form name="loginForm" action="${pageContext.request.contextPath}/login" method="POST" onsubmit="return validatePass()">
    <input type="hidden" name="action" value="addUser"/>
    <input type="text" name="nume" required/>
    <input type="text" name="prenume" required/>
    <input type="text" name="user_nameReg" required/>
    <input type="password" name="parolaReg" required/>
    <input type="password" name="parolaAgain" required/>
    <input type="submit" name="registerBtn" value="Register">
  </form>
  <p id="error"></p>
  <form action="${pageContext.request.contextPath}/login" method="GET">
    <input type="hidden" name="action" value="backLogin">
    <input type="submit" name="backBtn" value="Back to Login">
  </form>
</body>
</html>
