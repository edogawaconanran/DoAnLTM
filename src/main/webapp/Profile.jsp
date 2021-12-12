<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link rel="stylesheet" type="text/css" href="CSS/myStyle.css" />
<style>
	.submitButton{
		margin : 20px 10px 60px 1200px;
	}
	.info{
		background: white;
		padding: 10px;
		margin: 0 600px 0 600px;
		text-align: center;
	}
</style>
</head>
<body>
<%
	Statement statement = null;
	ResultSet resultSet = null;
	String name="", permission="";
	try{
		String connectionURL = "jdbc:mysql://localhost:3306/account"; 
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver"); 
		connection = DriverManager.getConnection(connectionURL, "root", "");
		statement = connection.createStatement();
		permission = request.getParameter("permission");
		if(permission.equals("Teacher")){
		String sql = "select * from teacher";
		resultSet = statement.executeQuery(sql);
		}
		else {
			String sql = "select * from student";
			resultSet = statement.executeQuery(sql);
		}
		resultSet.next();
		while(resultSet != null){
			if(request.getParameter("username").equals(resultSet.getString("Username"))){
				name = resultSet.getString("Fullname");
				break;
			}
			else
				resultSet.next();
		}
	}catch(Exception e){ out.println(e);}
	%>
	  <h1>Information</h1>
<div class="submitButton">
<form action="ChangePass.jsp" method="">
	<input type="submit" value="Change info">
</form>
<form action = "Main.jsp" method ="post">
	<input type="submit" value="Back to your class">
	<input type="hidden" value=<%= request.getParameter("username")%> name="username">
	<input type="hidden" value=<%= request.getParameter("permission") %> name="permission">
</form>
<form action="Login.jsp" method="">
	<input type="submit" value="Log out">
</form>
</div>
<div class="info">
Full name: <%=name %><br>
Account name: <%=request.getParameter("username") %>
</div>
</body>
</html>