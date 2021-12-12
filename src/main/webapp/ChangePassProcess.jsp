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
		String username = request.getParameter("username");
		String newpass = request.getParameter("newpass");
		String confirmnewpass = request.getParameter("confirmnewpass");
		if(!newpass.equals(confirmnewpass))
			response.sendRedirect("ChangePass.jsp");
		else{
		resultSet = statement.executeQuery("select * from teacher");
		resultSet.next();
		while(resultSet != null){
		if(username.equals(resultSet.getString("Username"))){
		String sql="Update teacher set Password = ? where Username = ?";
		ps = connection.prepareStatement(sql);
		ps.setString(1,newpass);
		ps.setString(2,username);
		int i = ps.executeUpdate();
		out.print(i);
		break;
		}
		else{
			resultSet.next();
		}
		}
		response.sendRedirect("Login.jsp");
		}
	}catch(Exception e){ out.println(e);}
	%>
</body>
</html>