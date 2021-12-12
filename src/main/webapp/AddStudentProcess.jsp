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
<title>Insert title here</title>
</head>
<body>
<%
Statement statement = null;
ResultSet resultSet = null, resultSet1 = null;
PreparedStatement ps = null;
try{
	String connectionURL = "jdbc:mysql://localhost:3306/account"; 
	Connection connection = null; 
	Class.forName("com.mysql.jdbc.Driver"); 
	connection = DriverManager.getConnection(connectionURL, "root", "");
	statement = connection.createStatement();
	String classname = request.getParameter("Classname");
	resultSet = statement.executeQuery("select * from "+classname);
	while(resultSet.next()!=false){
		if(request.getParameter("Username").equals(resultSet.getString("Studentname").toString()))
			request.setAttribute("result","Duplicate account!");
			request.setAttribute("classname",classname);
			RequestDispatcher rd = request.getRequestDispatcher("Result.jsp");
			rd.forward(request,response);
	}
	String student = "Student";
	resultSet1 = statement.executeQuery("select * from student");
	while(resultSet1.next()!=false){
		if(request.getParameter("Username").equals(resultSet1.getString("Username").toString())){
			String fullname = resultSet1.getString("Fullname");
			String Class = resultSet1.getString("Class");
			String studentname = resultSet1.getString("Username");
			String password = resultSet1.getString("Password");
			statement.executeUpdate("insert into "+classname+"(Fullname,Class,Studentname,Password,Permission)values('"+fullname+"','"+Class+"','"+studentname+"','"+password+"','"+student+"')");
			request.setAttribute("result","Successful!");
			request.setAttribute("classname",classname);
			RequestDispatcher rd = request.getRequestDispatcher("Result.jsp");
			rd.forward(request,response);
			break;	
		}}
}catch(Exception e){ e.printStackTrace();};
	%>
</body>
</html>