<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try{
	

            session.invalidate();
RequestDispatcher rd;  
rd = request.getRequestDispatcher("index.html");
rd.include(request, response);
return;
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
        %>
         

</body>
</html>