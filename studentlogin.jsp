<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>

<%
String rollno=request.getParameter("rollno");
String password=request.getParameter("password");
try{
	
    Class.forName("com.mysql.jdbc.Driver");    
    String url="jdbc:mysql://localhost:3306/fee";    
    String user="root";    
    String pass="0605";  
    Connection con=DriverManager.getConnection(url, user, pass); 
    String quer="select * from student";
    Statement stmt = con.createStatement();  
    ResultSet rs = stmt.executeQuery(quer);
    HashMap<String, String> map = new HashMap<>();
    while(rs.next()){
        String n = rs.getString("rollno");
        String m = rs.getString("password");
        map.put(n,m);
    }
    if(map.containsKey(rollno)){
        String getPass;
        getPass = map.get(rollno);
        if(getPass.equals(password)){
        	
        	session.setAttribute("rollno",rollno);
        	session.setAttribute("pass", password); 
            
        	out.println("<html><head></head><body onload=\"alert('Login Successful')\"></body></html>");
            RequestDispatcher rd;  
            rd = request.getRequestDispatcher("studentHome.jsp");
            rd.include(request, response);
            return;
        } 
        else{
            out.println("<html><head></head><body onload=\"alert('Incorrect Password')\"></body></html>");
          
        }
    }con.close();
    }


catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">   
  <link rel="stylesheet" type="text/css" href="style.css">  
  <style>
  .login-box{
    height: 380px;
}</style>
</head>
<body>

    <form method="post" action="studentlogin.jsp">
    <div class="login-box">
    <img src="user.png" class="avatar">
        <h1>Student Login</h1>
            <p>Username</p>
            <input type="number" name="rollno" placeholder="Enter Rollno." required="required">
            <p>Password</p>
            <input type="password" name="password" placeholder="Enter Password" required="required">
            <input type="submit" name="submit" value="Login">
            </form>
             <center><h1><a href="index.html">Back</a></h1></center>
        </div>   
    </body>
</html>
