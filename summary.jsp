<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
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
<center>
<h1>Summary</h1>
<table border="1">
<thead>
<tr>
<th>Total students with due</th>
<th>Total due amount</th>

</tr>
</thead>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql = "select count(*) as c, sum(amount) as s from student where amount>0";

resultSet = statement.executeQuery(sql);

while(resultSet.next()){
%>
<tr> 
<td><%=resultSet.getString("c") %></td>
<td><%=resultSet.getString("s") %></td>

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