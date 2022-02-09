<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String rollno=request.getParameter("rollno");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "fee";
String userid = "root";
String password = "0605";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<head>
<link href="viewstyle.css" rel="stylesheet" media="all" /></head>
<body>
<form method="post" action="studentlogout.jsp">
<input align="right" type="submit" name="Logout" value="Logout">

</form>
<%
		//HERE WE GETTING THE ATTRIBUTE DECLARED IN VALIDATE.JSP AND CHECKING IF IT IS NULL, THE USER WILL BE REDIRECTED TO LOGIN PAGE
			String uid = (String)session.getAttribute("rollno");
						

out.println(" <h1>Fee details of  : " +uid+"</h1>");

%>
<center>
<table border="1">
<thead>
<tr>
<th>Name</th>
<th>Roll no</th>
<th>Year</th>
<th>Department</th>
<th>Due amount</th>
</tr>
</thead>
<%
try{
	HttpSession s = request.getSession();
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from student where rollno="+rollno;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr> 
<td><%=resultSet.getString("name") %></td>
<td><%=resultSet.getString("rollno") %></td>
<td><%=resultSet.getString("year") %></td>
<td><%=resultSet.getString("dept") %></td>
<td><%=resultSet.getString("amount") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</center>

</body>
</html>