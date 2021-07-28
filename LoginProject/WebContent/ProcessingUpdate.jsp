<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
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
String description=request.getParameter("desc");
String fees1=request.getParameter("fees");
String resource=request.getParameter("res");
if(id != null)
{

int CourseID = Integer.parseInt(id);
int course_fees=Integer.parseInt(fees1);
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","sys as sysdba","system");
String sql="Update course1 set COURSE_ID=?,C_NAME=?,C_DESP=?,C_FEES=?,C_RESOURCE=? where COURSE_ID="+CourseID;
PreparedStatement ps= con.prepareStatement(sql);
ps = con.prepareStatement(sql);
ps.setInt(1,CourseID);
ps.setString(2, name);
ps.setString(3, description);
ps.setInt(4, course_fees);
ps.setString(5, resource);
int i = ps.executeUpdate();
if(i > 0)
{
out.print("Record Updated Successfully!");
}
else
{
out.print("There is a problem in updating Record.");
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