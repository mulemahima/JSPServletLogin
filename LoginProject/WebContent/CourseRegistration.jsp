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
</head><style>
body  
{  
    margin: 0;  
    padding: 0;  
    background-color:#6abadeba;  
    font-family: 'Arial';  
}  
.login{  
        width: 382px;  
        overflow: hidden;  
        margin: auto;  
        margin: 20 0 0 450px;  
        padding: 80px;  
        background: #23463f;  
        border-radius: 15px ;  
          
}  
h2{  
    text-align: center;  
    color: #277582;  
    padding: 20px;  
}  
label{  
    color: #08ffd1;  
    font-size: 17px;  
}  
#Uname{  
    width: 300px;  
    height: 30px;  
    border: none;  
    border-radius: 3px;  
    padding-left: 8px;  
}  
#Pass{  
    width: 300px;  
    height: 30px;  
    border: none;  
    border-radius: 3px;  
    padding-left: 8px;  
      
}  
#log{  
    width: 300px;  
    height: 30px;  
    border: none;  
    border-radius: 17px;  
    padding-left: 7px;  
    color: blue;  
  
  
}  
span{  
    color: white;  
    font-size: 17px;  
}  
a{  
    float: right;  
    background-color: grey;  
}  
</style>
<script>  
function validateform(){  
	
	var Name=document.myform.name.value;  
	var Ph_no=document.myform.no.value;  
	if (Name==null || Name==""){  
		alert("Name can't be blank");  
		return false;  
		}else if(Ph_no==null || Ph_no=="")
		{
			alert("Phone no can't be blank ");  
			return false;  
			}
		else if(Ph_no.length==9)
		{
			alert("length should be 10");  
			return false;  
			}
	}  
</script>
<body>
<%
String id=request.getParameter("id");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
java.sql.Connection con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/orcl","sys as sysdba","system");
Statement statement = con.createStatement();
String sql="select * from course1 WHERE COURSE_ID="+id;
ResultSet rs = statement.executeQuery(sql);
while(rs.next()){
%>
<h2>Course Registration</h2>
<div class="login">
    <link rel="stylesheet" type="text/css"> 
    <form name="myform" id="login"  method="post" action="ProcessingCourseRegistration.jsp" onsubmit="return validateform()" >
    <label><b>Applicant Name:</b></label>
    <input type="text" name="name" id="Uname" value=<%= session.getAttribute( "currentSessionUser" ) %>>
    <br><br>
    <label><b>Course id:</b></label>
    <input type="text" name="id" id="Uname"  value="<%=rs.getInt(1) %>" >
    <br><br>
    <label><b>Course name:</b></label>
    <input type="text" name="cname" id="Uname" value="<%=rs.getString(2) %>" >
    <br><br>
    <label><b>Course Fees:</b></label>
    <input type="text" name="fees" id="Uname" value="<%=rs.getInt(4) %>">
    <br><br>
    <label><b>Phone Number:</b></label>
    <input type="text" name="no" id="Uname" >
    <br><br>
    <input type="submit" value="submit" id="log">
    </form>
    </div>
<%
}
con.close();
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>