<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
 
<%
    if(request.getParameter("submit")!=null)
    {
        int year = Integer.parseInt(request.getParameter("year"));
        String dept = request.getParameter("dept");
        int amount = Integer.parseInt(request.getParameter("fee"));
        
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost/fee","root","0605");
        
        
        pst = con.prepareStatement("update student set amount = ? + amount where year = ? and dept = ?");
        pst.setInt(1, amount);
        pst.setInt(2, year);
        pst.setString(3, dept);
        
        int i=pst.executeUpdate();
       
           RequestDispatcher rd;  
            rd = request.getRequestDispatcher("acnthome.html");
            rd.include(request, response); 
            
        
        
        %>
        
      
    <%            
    }
 
%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add fee</title>
        <style>
            body {
            margin: 0;
            padding: 0;
            background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt22vZUzseJvP9bKhj6e43l4c_Rad3dYPdwQ&usqp=CAU');
           background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            position: relative
            }
            input[type=number],input[type=text],input[type=password], select {
            width: 40%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: medium;
            text-align:center;
            box-sizing: border-box;
            }
            div{
                text-align: center;
            }
            input[type=submit] {
            width: 40%;
            background-color:black;
            color: white;
            font-weight:bold;
            font-size: medium;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type=reset] {
            width: 40%;
            background-color:black;
            color: white;
            font-weight:bold;
            font-size: medium;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        </style>
        
   
        
    </head>
    <body>
    <br><br>
        <center><h1>Add fee</h1></center>
        
        
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="addnewfee.jsp" >
                    
                 
                  <label for="year" style="color:white; font-ssize: medium;"><b>Year</b></label>
                
                <br>
                <select name="year">
                    
                    <option value=1>Year 1</option>
                    <option value=2>Year 2</option>
                    <option value=3>Year 3</option>
                    <option value=4>Year 4</option>
                    <option value=5>Year 5</option>
                    
                  </select><br><br>
                  
                 <label for="dept" style="color:white; font-ssize: medium;"><b>Department</b></label>
                
                <br>
                <select name="dept">
                    
                    <option value="BE">BE</option>
                    <option value="MSc">MSc</option>
                    <option value="MCA">MCA</option>
                    <option value="MBA">MBA</option>
                   
                    
                  </select>
               	<br><br>
                        
                    
                        <label for="fee" style="color:white; font-ssize: medium;"><b>Fee</b></label>
                        <br>
                        <input type="number" class="form-control" placeholder="Enter fee" name="fee" id="fee" min="0" required >
                     
                
                    
                    
                         </br></br>
                        
                    
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                      <br><input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     
                </form>
            </div>          
        </div>
  
    </body>
</html>