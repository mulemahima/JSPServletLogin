<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome Admin</title>
</head>
<style>
h2{  
    text-align: center;  
    color: #277582;  
    padding: 20px;  
}
</style>
<body>
<center><h1>Welcome ,<%= session.getAttribute( "currentSessionUser" ) %></h1>
   </Center> 
   
   <h2>Course Content</h2>
   
<%
try {

Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","sys as sysdba","system");
Statement statement = con.createStatement();



String QueryString = "SELECT * from course1";
ResultSet rs = statement.executeQuery(QueryString);

%>
<TABLE cellpadding="15" border="1" style="background-color: #ffffcc;">
<TR>
<TD>Course ID</TD>
<TD>Course Name</TD>
<TD>Description</TD>
<TD>Fees</TD>
<TD>Resource</TD>
</TR>
<%
while (rs.next()) {
%>

<TR>
<TD><%=rs.getInt(1)%></TD>
<TD><%=rs.getString(2)%></TD>
<TD><%=rs.getString(3)%></TD>
<TD><%=rs.getInt(4)%></TD>
<TD><%=rs.getString(5)%></TD>
<td><a href="Delete.jsp?id=<%=rs.getInt(1) %>"><button type="button" class="delete">Delete</button></a></td>
<td><a href="Update.jsp?id=<%=rs.getInt(1)%>"><button type="button" class="update">Update</button></a></td>
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


</TABLE>
<TABLE>
<TR>
<TD><FORM ACTION="Login.jsp" method="get" >
<button type="submit">back</button></TD>
<td><a href="ShowFeedback.jsp"><button type="button" class="fedback">ShowFeedback</button></a></td></TD>
</TR>
</TABLE>
</font>

</body>
</html>