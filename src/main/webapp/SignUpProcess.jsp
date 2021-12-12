<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
<title>Insert title here</title>
</head>
<body>
<%	
	Statement statement = null;
	ResultSet resultSet = null;
	PreparedStatement ps = null;
	try{
		String connectionURL = "jdbc:mysql://localhost:3306/account"; 
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver"); 
		connection = DriverManager.getConnection(connectionURL, "root", "");
		statement = connection.createStatement();
		String name = request.getParameter("name");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String confirmpassword = request.getParameter("confirmpassword");
		if(!password.equals(confirmpassword))
			response.sendRedirect("SignUp.jsp");
		else if(name.equals("") || username.equals("") || password.equals("") || confirmpassword.equals(""))
			response.sendRedirect("SignUp.jsp");
		else{
		String admin = "Admin";
		int i=statement.executeUpdate("insert into teacher(Fullname,Username,Password,Permission)values('"+name+"','"+username+"','"+password+"','"+admin+"')");
		out.print("Sign up successful!");
		}	
		}catch(Exception e){ out.println(e);}
	%>
</body>
</html>