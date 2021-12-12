<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body>
<div class="container">
  <section id="content">
    <form action="CheckLogin.jsp" method="post">
      <h1>Login</h1>
      <div>
        <input type="text" placeholder="Username" required="" id="username" name="username" />
      </div>
      <div>
        <input type="password" placeholder="Password" required="" id="password" name="password" />
      </div>
      <div>
        <input type="submit" value="Log in" />
        <a href="ChangePass.jsp">Lost your password?</a>
        <a href="SignUp.jsp">Sign Up</a>
      </div>
    </form><!-- form -->
    
  </section><!-- content -->
</div>
</body>
</html>