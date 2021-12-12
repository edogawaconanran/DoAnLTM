<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body>
<div class="container">
  <section id="content">
    <form action="SignUpProcess.jsp" method="post">
      <h1>Sign up</h1>
      <div>
        <input type="text" placeholder="Full name" required="" id="username" name="name" />
      </div>
      <div>
        <input type="text" placeholder="Account name" required="" id="username" name="username" />
      </div>
      <div>
        <input type="password" placeholder="Password" required="" id="password" name="password" />
      </div>
      <div>
        <input type="password" placeholder="Confirm password" required="" id="password" name="confirmpassword" />
      </div>
      <div>
      	<input type="submit" value="Sign up" />
      </div>
    </form><!-- form -->
  </section><!-- content -->
</div>
</body>
</html>