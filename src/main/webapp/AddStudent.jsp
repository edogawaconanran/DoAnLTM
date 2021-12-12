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
<title>Add student</title>
<link rel="stylesheet" type="text/css" href="CSS/myStyle.css" />
<style>
#customers {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

#customers td, #customers th {
  border: 1px solid #ccc;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #04AA6D;
  color: white;
}
</style>
</head>
<body>
	<h1>List of students</h1>

<table id="customers">
  <tr>
    <th>Full name</th>
    <th>Username</th>
    <th>Class</th>
    <th>Add</th>
  </tr>
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
	  	resultSet = statement.executeQuery("select * from student");
	  	String classname = request.getParameter("classname");
	  	while(resultSet.next() != false){
  %>
  <tr>
    <td><%= resultSet.getString("Fullname") %></td>
    <td><%= resultSet.getString("Username") %></td>
    <td><%= resultSet.getString("Class") %></td>
    <td><form action="AddStudentProcess.jsp" method="post"><input type="submit" value="Add"><input type="hidden" value="<%= resultSet.getString("Username").toString() %>" name="Username"><input type="hidden" value="<%=classname %>"name="Classname"></form>
  </tr>
  <%}}catch(Exception e){} %>
</table>
</body>
</html>