<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change password</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
</head>
<body>
	<div class="container">
  <section id="content">
    <form action="ChangePassProcess.jsp" method="post">
      <h1>New password</h1>
      <div>
        <input type="text" placeholder="Username" required="" id="username" name="username" />
      </div>
      <div>
        <input type="password" placeholder="New password" required="" id="password" name="newpass" />
      </div>
      <div>
        <input type="password" placeholder="Confirm new password" required="" id="password" name="confirmnewpass" />
      </div>
      <div>
        <input type="submit" value="Change" />
      </div>
    </form><!-- form -->
    
  </section><!-- content -->
</div>
</body>
</html>