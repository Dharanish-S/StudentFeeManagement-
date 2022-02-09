<%
String username1=request.getParameter("username");
String password1=request.getParameter("password");

if(username1.equalsIgnoreCase("admin") && password1.equals("admin1234"))
{
	response.sendRedirect("adminHome.html");
	
}
else{
	response.sendRedirect("errorAdminLogin.html");
}
%>


