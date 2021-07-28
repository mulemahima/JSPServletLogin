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
String name=request.getParameter("name");
String id = request.getParameter("id");
String cou_name=request.getParameter("cname");
String fees1=request.getParameter("fees");
String Ph_no=request.getParameter("no");
if(id != null)
{

int CourseID = Integer.parseInt(id);
int course_fees=Integer.parseInt(fees1);
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","sys as sysdba","system");
//String sql="Insert into COURSE_REGISTRATION Values(name,Ph_no,Course_ID,cou_name,fee1)";
Statement statement = con.createStatement();
int i = statement.executeUpdate("insert into COURSE_REGISTRATION(REG_NAME,MOBILE_NO,COURSE_ID,C_NAME,C_FEES) values('"+name+"','"+Ph_no+"','"+CourseID+"','"+cou_name+"','"+course_fees+"')");
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