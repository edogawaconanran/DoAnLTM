<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="CSS/myStyle.css" />
</head>
<body>
<h3><%=request.getAttribute("result") %></h3><form action="Class.jsp" method="post">
<input type="submit" value="OK">
<input type="hidden" value="<%= request.getAttribute("classname") %>" name="classname">
</form>
</body>
</html>