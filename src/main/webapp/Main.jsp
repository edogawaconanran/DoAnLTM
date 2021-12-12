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
<link rel="stylesheet" type="text/css" href="CSS/myStyle.css" />
<title>Your class</title>
</head>
<body>
  <h1>Your classes</h1>

<div class="rightContainer">
<% if(request.getAttribute("username") != null) {%>
<h4>Welcome <%= request.getAttribute("username") %></h4> <%} %>
<% if(request.getAttribute("username") == null) {%>
<h4>Welcome <%= request.getParameter("username") %></h4> <%} %>
<%
String permission = "";
if(request.getAttribute("permission") != null){
	permission = request.getAttribute("permission").toString();}
else { 
	permission = request.getParameter("permission"); }
%>
<form action = "Profile.jsp" method ="post">
	<input type="submit" value="Profile">
	<input type="hidden" value=<%=request.getParameter("username") %> name="username">
	<input type="hidden" value=<%=permission %> name="permission">
</form>
<form action="Login.jsp" method="">
	<input type="submit" value="Log out">
</form>
</div>
<%
	if(permission.equals("Teacher")){
%>
<div>
<form action="NewClass.jsp" method="post">
	<input type="hidden" value=<%=request.getParameter("username") %> name="username">
	<input type="hidden" value=<%=permission %> name="permission">
	<input type="submit" value="Create new class">
</form>
</div>
<div>
<p>
List of classes:<br>
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
	resultSet = statement.executeQuery("select Classname from class"); %>
	<ul> <%
	while(resultSet.next() == true){
%>
<li><a href = "Class.jsp?classname=<%=resultSet.getString("Classname")%>&username=<%= request.getParameter("username")%>&permission=<%=permission%>"><%out.print(resultSet.getString("Classname")); %></a></li>
<%
	} %>
	</ul>
	<%
}catch(Exception e){ }
	}
else {
%>
<p>
List of classes:<br>
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
	resultSet = statement.executeQuery("select Classname from class"); %>
	<ul> <%
	while(resultSet.next() == true){
		String s = resultSet.getString("Classname");
		resultSet1 = statement.executeQuery("select Studentname from " + s);
		while(resultSet1.next() == true){
			if(resultSet1.getString("Studentname").equals(request.getParameter("username").toString())){ %>
				<li><a href = "Class.jsp?classname=<%=s%>&username=<%= request.getParameter("username")%>&permission=<%=permission%>"><%out.print(s); %></a></li>
<% resultSet1.close(); break;}} resultSet1.close();} %>
</ul>
<% }catch(Exception e){}} %>
</p>
</div>
</body>
</html>