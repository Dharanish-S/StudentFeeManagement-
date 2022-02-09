<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.*,java.util.*"%>

<%
String eid=request.getParameter("eid");
String password=request.getParameter("password");
try{
	
    Class.forName("com.mysql.jdbc.Driver");    
    String url="jdbc:mysql://localhost:3306/fee";    
    String user="root";    
    String pass="0605";  
    Connection con=DriverManager.getConnection(url, user, pass); 
    String quer="select * from acnts";
    Statement stmt = con.createStatement();  
    ResultSet rs = stmt.executeQuery(quer);
    HashMap<String, String> map = new HashMap<>();
    while(rs.next()){
        String n = rs.getString("eid");
        String m = rs.getString("password");
        map.put(n,m);
    }
    if(map.containsKey(eid)){
        String getPass;
        getPass = map.get(eid);
        if(getPass.equals(password)){
        	session.setAttribute("name",eid);
        	session.setAttribute("pass", password); 
        	out.println("<html><head></head><body onload=\"alert('Login Successful')\"></body></html>");
            
            RequestDispatcher rd;  
            rd = request.getRequestDispatcher("acnthome.html");
            rd.include(request, response);
            return;
        } 
        else{
            
            RequestDispatcher rd;  
            rd = request.getRequestDispatcher("erroracntlogin.html");
            rd.include(request, response);
            return;
        }
    }
    else{
        
        RequestDispatcher rd;  
        rd = request.getRequestDispatcher("erroracntlogin.html");
        rd.include(request, response);
        return;
    }}


catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>