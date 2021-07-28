<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>Feedbacks</h2>
   
<%
try {

Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","sys as sysdba","system");
Statement statement = con.createStatement();



String QueryString = "SELECT * from Feedback";
ResultSet rs = statement.executeQuery(QueryString);

%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<TR>
<TD>User ID</TD>
<TD>Name</TD>
<TD>Email</TD>
<TD>Feedback</TD>

</TR>
<%
while (rs.next()) {
%>

<TR>
<TD><%=rs.getInt(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getString(4)%></TD>

</TR>
<% } %>
<%
// close all the connections.
rs.close();
statement.close();

} catch (Exception ex) {
%>
</font>
<font size="+3" color="red"></b>
<%
System.out.println("Unable to connect to database.");
}
%>

</body>
</html>