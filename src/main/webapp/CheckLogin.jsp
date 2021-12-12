<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
	String sql,username,password;
	try{
		String connectionURL = "jdbc:mysql://localhost:3306/account"; 
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver"); 
		connection = DriverManager.getConnection(connectionURL, "root", "");
		statement = connection.createStatement();
		sql = "select * from teacher";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next() != false){
		username = request.getParameter("username");
		password = request.getParameter("password");
		if(username.equals(resultSet.getString("Username")) && password.equals(resultSet.getString("Password"))){
			String permission = resultSet.getString("Permission");
			request.setAttribute("username", username);
			request.setAttribute("permission",permission);
			RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
			rd.forward(request,response);
			break;
		}
		sql = "select * from student";
		resultSet = statement.executeQuery(sql);
		while(resultSet.next() != false){
		username = request.getParameter("username");
		password = request.getParameter("password");
		if(username.equals(resultSet.getString("Username")) && password.equals(resultSet.getString("Password"))){
			String permission = resultSet.getString("Permission");
			request.setAttribute("permission",permission);
			request.setAttribute("username", username);
			RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
			rd.forward(request,response);
			break;
		}
		}
		}
		response.sendRedirect("Login.jsp");
	}catch(Exception e){ out.println(e);}
	%>
</body>
</html>