<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>

<%
String name=request.getParameter("name");
String eid=request.getParameter("eid");
String mobile=request.getParameter("mobile");
String password=request.getParameter("password");
String email=request.getParameter("email");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fee", "root", "0605");
Statement st=conn.createStatement();

ResultSet rs=st.executeQuery("select eid from acnts where eid like '"+eid+"'");
if(rs.next()){

	  out.println("<html><head></head><body onload=\"alert('already exists')\"></body></html>");
	  RequestDispatcher rd;  
	  rd = request.getRequestDispatcher("Add Accountant.html");
	 
}
else{

int i=st.executeUpdate("insert into acnts(name,eid,mobile,email,password)values('"+name+"','"+eid+"','"+mobile+"','"+email+"','"+password+"')");
RequestDispatcher rd;  
rd = request.getRequestDispatcher("adminHome.html");
rd.include(request, response); 
if(i==1)    
{    
    out.println("<html><head></head><body onload=\"alert('Registered Successfully')\"></body></html>");
   
    rd = request.getRequestDispatcher("adminHome.html");
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