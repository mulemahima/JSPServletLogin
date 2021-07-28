<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>  
<%@page import="java.sql.Statement"%>      
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String id = request.getParameter("id");
String name=request.getParameter("name");
String mob_no=request.getParameter("no");
String email1=request.getParameter("email");
String location=request.getParameter("loc");
String Pass=request.getParameter("pass");
if(id != null)
{

int CourseID = Integer.parseInt(id);

try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","sys as sysdba","system");
String sql="Insert into USER1 Values('"+CourseID+"','"+name+"','"+mob_no+"','"+email1+"','"+location+"','"+Pass+"')";
Statement statement = con.createStatement();
int i = statement.executeUpdate(sql);
if(i > 0)
{
out.print("Registration successfully done!");
}
else
{
out.print("There is a problem in adding Record.");
}
}
catch(Exception sql)
{
request.setAttribute("error", sql);
System.out.println(sql);
}
}
%>
</body>
</html>