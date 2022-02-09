<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
int rollno=Integer.parseInt(request.getParameter("rollno"));
int year=Integer.parseInt(request.getParameter("year"));
String dept=request.getParameter("dept");
String password=request.getParameter("password");
int amount=0;

try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fee", "root", "0605");
Statement st=conn.createStatement();

ResultSet rs=st.executeQuery("select rollno from student where rollno like '"+rollno+"'");
if(rs.next()){

	  out.println("<html><head></head><body onload=\"alert('already exists')\"></body></html>");
	 
	 
}
else{

int i=st.executeUpdate("insert into student(name,email,mobile,rollno,year,dept,password,amount)values('"+name+"','"+email+"','"+mobile+"','"+rollno+"','"+year+"','"+dept+"','"+password+"','"+amount+"')");

if(i==1)    
{    
	
   RequestDispatcher rd;  
    rd = request.getRequestDispatcher("acnthome.html");
    rd.include(request, response); 
    return;
}
}
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>