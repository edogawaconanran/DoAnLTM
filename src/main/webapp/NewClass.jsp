<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign up</title>
<link rel="stylesheet" type="text/css" href="CSS/style.css" />
<style>
form input[type="reset"] {
  background: rgb(254,231,154);
  background: -moz-linear-gradient(top,  rgba(254,231,154,1) 0%, rgba(254,193,81,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  background: -o-linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  background: -ms-linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  background: linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fee79a', endColorstr='#fec151',GradientType=0 );
  -webkit-border-radius: 30px;
  -moz-border-radius: 30px;
  -ms-border-radius: 30px;
  -o-border-radius: 30px;
  border-radius: 30px;
  -webkit-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  -moz-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  -ms-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  -o-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  border: 1px solid #D69E31;
  color: #85592e;
  cursor: pointer;
  float: left;
  font: bold 15px Helvetica, Arial, sans-serif;
  height: 35px;
  margin: 20px 0 35px 70px;
  position: relative;
  text-shadow: 0 1px 0 rgba(255,255,255,0.5);
  width: 120px;
}
</style>
</head>
<body>
<div class="container">
  <section id="content">
    <form action="NewClassProcess.jsp" method="post">
      <h1>Create new class</h1>
      <div>
        <input type="text" placeholder="Class ID" required="" id="username" name="classcode" />
      </div>
      <div>
        <input type="text" placeholder="Class name" required="" id="username" name="classname" />
      </div>
      	<input type="hidden" value=<%= request.getParameter("username") %> name="username"/>
      	<input type="hidden" value=<%= request.getParameter("permission") %> name="permission">
      	<input type="submit" value="OK" />
      	<input type="reset" value="Reset" />
      </div>
    </form><!-- form -->
  </section><!-- content -->
</div>
</body>
</html>