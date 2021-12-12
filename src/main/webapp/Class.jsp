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
<%	
	Statement statement = null;
	ResultSet resultSet = null;
	PreparedStatement ps = null;
	String classname = "";
	String classname1 = "";
	String s = "";
	String permission = "";
	try{
		String connectionURL = "jdbc:mysql://localhost:3306/account"; 
		Connection connection = null; 
		Class.forName("com.mysql.jdbc.Driver"); 
		connection = DriverManager.getConnection(connectionURL, "root", "");
		statement = connection.createStatement();
		classname = (String)request.getParameter("classname");
		classname1 = (String)request.getAttribute("classname1");
		permission = (String)request.getParameter("permission");
		if(classname != null){
			s = "Welcome to "+classname;
			resultSet = statement.executeQuery("select * from "+classname);
		}
		else{
			s = "Welcome to "+classname1;
			resultSet = statement.executeQuery("select * from "+classname1);
		}
	}catch(Exception e){ out.println(e);}
	%>
	<h1><%= s %></h1>
	<%if(permission.equals("Teacher")){%>
	<div>
	<form action = "AddStudent.jsp" method = "post">
		<input type = "hidden" value = "<%=classname %>" name = "classname">
		<input type = "submit" value = "Add student">
	</form>
	<%} %>
	<form action="Meeting.jsp">
    	<input type="submit" value="Meeting now" />
	</form>
	</div><br><br>
	<div>
	<h3>Class members:</h3>
	<table id="customers">
	  <tr>
	    <th>Full name</th>
	    <th>Username</th>
	    <th>Class</th>
	  </tr>
	<%
  		while(resultSet.next() != false){
	%>
		<tr>
		<td><%= resultSet.getString("Fullname") %></td>
		<td><%= resultSet.getString("Studentname") %></td>
		<td><%= resultSet.getString("Class") %></td>
		</tr>
	<%} %>
	</table>
	</div>
	<br><br>
	<div>
	<a href = "Main.jsp?username=<%= request.getParameter("username")%>&permission=<%=request.getParameter("permission")%>">Back to class lists</a>
	</div>
</body>
</html>