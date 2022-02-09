<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

int rollno=Integer.parseInt(request.getParameter("rollno"));
int year=Integer.parseInt(request.getParameter("year"));
String dept=request.getParameter("dept");
int fee=Integer.parseInt(request.getParameter("fee"));
int due=0;


try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/fee", "root", "0605");
Statement st=conn.createStatement();
PreparedStatement pst;



ResultSet rs=st.executeQuery("select amount from student where rollno like '"+'%'+rollno+'%'+"'");
if(rs.next()){
	due=rs.getInt("amount");
	due=due-fee;
	if(due<0){
		due=0;}
	
	
	 
}


	 pst = conn.prepareStatement("update student set amount = ? where rollno = ?");
     pst.setInt(1, due);
     pst.setInt(2, rollno);
     pst.executeUpdate();
    

   RequestDispatcher rd;  
    rd = request.getRequestDispatcher("acnthome.html");
    rd.include(request, response); 
    return;


}

catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>