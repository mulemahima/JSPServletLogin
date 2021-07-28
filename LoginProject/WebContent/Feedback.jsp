<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
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
	var id=document.myform.id.value;  	
var name=document.myform.name.value;   
var email=document.myform.email.value;  
var loc=document.myform.feedback.value;  
 
if (name==null || name=="" || id==null || id=="" || email==null || email=="" || loc==null || loc=="" ){  
  alert("This field can't be blank");  
  return false;  
}
}  
</script>
<body>
<h2>FeedBack</h2>
     <div class="login">
    <link rel="stylesheet" type="text/css"> 
<form name="myform" id="login" method="post" action="FeedbackProcess.jsp" onsubmit="return validateform()" >
<label><b>User Name:</b></label>
<input type="text" name="name" id="Uname">
<br><br>
<label><b>User ID: </b></label>    
<input type="text" name="id" id="Uname">    
<br><br>
<label><b>Email Address:</b></label>
<input type="text" name="email" id="Uname">
<br><br>
<label><b>Feedback:</b></label>
<input type="text" name="feedback" id="Uname" rowspan="2">
<br>
<br>
<input type="submit" value="submit" id="log">
</form>
</div>
</body>
</html>