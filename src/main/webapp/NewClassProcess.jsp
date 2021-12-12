<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Connection connection = null;
try {
Class.forName("com.mysql.jdbc.Driver");
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/account", "root", "");
Statement statement = connection.createStatement();
String classcode = request.getParameter("classcode");
String classname = request.getParameter("classname");
String query = "CREATE TABLE "+classname+" (Fullname VARCHAR(100), Class VARCHAR(20), Studentname VARCHAR(100), Password VARCHAR(100), Permission VARCHAR(20), primary key(Studentname));";
statement.executeUpdate(query);
int i=statement.executeUpdate("insert into class(ClassID,Classname)values('"+classcode+"','"+classname+"')");
String username = request.getParameter("username");
request.setAttribute("username", username);
request.setAttribute("permission",request.getParameter("permission"));
RequestDispatcher rd = request.getRequestDispatcher("Main.jsp");
rd.forward(request,response);
}
catch (Exception e)
{
out.println(e);
}
%>
</body>
</html>