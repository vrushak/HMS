<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html >
<head>
  <meta charset="UTF-8">
  <title>CMS Wedge</title>
  
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">

  <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900|RobotoDraft:400,100,300,500,700,900'>

<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/font-awesome.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap.min.css" />' >
<link rel="stylesheet" href='<c:url value="/resources/css/bootstrap-select.min.css" />' />

<script type="text/javascript" src="/HMS/resources/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/moment.min.js"></script>
<script type="text/javascript" src="/HMS/resources/js/bootstrap-select.min.js"></script>



<style>
body {
  background: #e9e9e9;
  color: #666666;
  font-family: 'RobotoDraft', 'Roboto', sans-serif;
  font-size: 14px;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

/* Pen Title */
.pen-title {
  padding: 50px 0;
  text-align: center;
  letter-spacing: 2px;
}
.pen-title h1 {
  margin: 0 0 20px;
  font-size: 48px;
  font-weight: 300;
}
.pen-title span {
  font-size: 12px;
}
.pen-title span .fa {
  color: #33b5e5;
}
.pen-title span a {
  color: #33b5e5;
  font-weight: 600;
  text-decoration: none;
}

/* Form Module */
.form-module {
  position: relative;
  background: #ffffff;
  max-width: 320px;
  width: 100%;
  border-top: 5px solid #33b5e5;
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.1);
  margin: 0 auto;
}
.form-module .toggle {
  cursor: pointer;
  position: absolute;
  top: -0;
  right: -0;
  background: #33b5e5;
  width: 30px;
  height: 30px;
  margin: -5px 0 0;
  color: #ffffff;
  font-size: 12px;
  line-height: 30px;
  text-align: center;
}
.form-module .toggle .tooltip {
  position: absolute;
  top: 5px;
  right: -65px;
  display: block;
  background: rgba(0, 0, 0, 0.6);
  width: auto;
  padding: 5px;
  font-size: 10px;
  line-height: 1;
  text-transform: uppercase;
}
.form-module .toggle .tooltip:before {
  content: '';
  position: absolute;
  top: 5px;
  left: -5px;
  display: block;
  border-top: 5px solid transparent;
  border-bottom: 5px solid transparent;
  border-right: 5px solid rgba(0, 0, 0, 0.6);
}
.form-module .form {
  display: none;
  padding: 40px;
}
.form-module .form:nth-child(2) {
  display: block;
}
.form-module h2 {
  margin: 0 0 20px;
  color: #33b5e5;
  font-size: 18px;
  font-weight: 400;
  line-height: 1;
}
.form-module input {
  outline: none;
  display: block;
  width: 100%;
  border: 1px solid #d9d9d9;
  margin: 0 0 20px;
  padding: 10px 15px;
  box-sizing: border-box;
  font-wieght: 400;
  -webkit-transition: 0.3s ease;
  transition: 0.3s ease;
}
.form-module input:focus {
  border: 1px solid #33b5e5;
  color: #333333;
}
.form-module button {
  cursor: pointer;
  background: #33b5e5;
  width: 100%;
  border: 0;
  padding: 10px 15px;
  color: #ffffff;
  -webkit-transition: 0.3s ease;
  transition: 0.3s ease;
}
.form-module button:hover {
  background: #178ab4;
}
.form-module .cta {
  background: #f2f2f2;
  width: 100%;
  padding: 15px 40px;
  box-sizing: border-box;
  color: #666666;
  font-size: 12px;
  text-align: center;
}
.form-module .cta a {
  color: #333333;
  text-decoration: none;
}

nav ul .ls {
width : 300px;
}
</style>

<script type="text/javascript">
function handleSelect(elm)
{
window.location = elm.value;
}

function formab(){
	alert();
	document.getElementById("gh").submit();
	document.getElementById("f").submit();
	alert();
}

function copyval(val){
	$("#exp").text("Licence will expire on "+val)
}
</script>
  
</head>

<body>
   <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" >Login</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="/HMS/welcome">Home</a></li>
      <li class="col-xs-4"><a href="/HMS/licence">Licence</a></li>
     
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li class="ls"><a href="#" id="exp"></a></li>
      
    </ul>
  </div>
</nav>
 <c:if test="${param.error == 'true'}">
         <div style="color:red;margin:10px 0px;">
          
                Login Failed!!!<br />
                Reason :  ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
                 
         </div>
    </c:if>
      
        <h3 style="color:red;">${message}</h3>
<!-- Form Mixin-->
<!-- Input Mixin-->
<!-- Button Mixin-->
<!-- Pen Title-->
<div class="pen-title">
  <h1>Welcome to CMS Wedge</h1><span>by <a href=''>Techwedge Consultants</a></span>
</div>
<!-- Form Module-->
<div class="module form-module">
  <div class="toggle"><i class="fa fa-times fa-pencil"></i>
    <div class="tooltip">Click Me</div>
  </div>

  <div class="form">
    <h2>Login to your account</h2>
    
     <form name='f' id='f' action="${pageContext.request.contextPath}/j_spring_security_check" method='POST' >
      <input form="f"  type="text" name ="username" id ="username" placeholder="Username"/>
      <input form="f" type="password" name = "password"  id ="password" placeholder="Password"/>
     
    <input form="f" type="submit" class="btn btn-info"  value="Login">
    </form>
  </div>
  <div class="form">
    <h2>Create an account</h2>
    <form action ="${pageContext.request.contextPath}/saveuser.html" method="post">
      <input type="text" id="username" name="username" placeholder="Username"/>
      <input type="password" id="password" name="password" placeholder="Password"/>
     
      <select class="form-control" name="role" id="role">
      <option selected disabled>Select the Role</option>
      <option value="DOCTOR">DOCTOR</option>
      <option value="NURSE">NURSE</option>
      <option value="ASSISTANT">ASSISTANT</option>
      </select>
 <br>
      <input type="submit" class="btn btn-info" value="Register">
    </form>
  </div>
  
</div>
  


 <script>
// Toggle Function
$('.toggle').click(function(){
  // Switches the Icon
  $(this).children('i').toggleClass('fa-pencil');
  // Switches the forms  
  $('.form').animate({
    height: "toggle",
    'padding-top': 'toggle',
    'padding-bottom': 'toggle',
    opacity: "toggle"
  }, "slow");
});

</script>
<c:forEach var="p"  items="${list}">
<script>
copyval('<c:out value="${p.expiry}" />')
</script>
</c:forEach>

</body>
</html>
