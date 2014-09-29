<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<c:set var="flag" value="0" scope="session"/>
<html>
<head>
    <title>Sign Up</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>

    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />

	<link rel="stylesheet" href="signup.css"/>
</head>
<body>
<form class="sign-up" action="signup.jsp" method="POST">
    <h1 class="sign-up-title">Sign up</h1>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <input type="text" class="sign-up-input" name="first_name" placeholder="First Name*" autofocus>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <input type="text" class="sign-up-input" name="last_name" placeholder="Last Name*">
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <input type="text" class="sign-up-input" name="username" placeholder="Username*" autofocus>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

    <input type="password" class="sign-up-input" name="password" placeholder="Password*"> <br><br>


    <div class="row">

    	<div class="col-lg-2">
		  <input type="number" class="form-control" name="roll_no" placeholder="Roll no.*">
  		</div>
  		
    	<div class="col-lg-2">
		  <input type="number" class="form-control" name="fe_marks" placeholder=".F.E. %*">
  		</div>
  			
  		<div class="col-lg-2">
  	      <input type="number" class="form-control" name="se_marks" placeholder=".S.E. %*">
  		</div>

  		<div class="col-lg-2">
  		  <input type="number" class="form-control" name="te_marks" placeholder=".T.E. %*">
		</div>

		<div class="col-lg-2">
  		  <input type="text" class="form-control" name="branch" placeholder="Branch*">
		</div>

		<div class="col-lg-2">
  		  <input type="number" class="form-control" name="backlogs" placeholder="Backlogs*">
		</div>
  	
            	
  	</div>

    <br><br>
     
    <div class="col-xs-4">
  		  <input type="email" class="form-control" name="email" placeholder="email">
    </div>
  	

     <!--
  	 <div class="form-group">
    	<label for="exampleInputFile">File input</label>
    	<input type="file" id="exampleInputFile">

    	<p class="help-block">Upload your Resume.</p>
     </div>-->
   
  		
    <br><br>
      
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     <button type="submit" class="btn btn-primary btn-lg">Sign Up</button>
     <br>
     <font color="#cc0000">* Please enter mandatory information.</font>
      
</form>
                                      <%--form processing--%> 
    <sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/placementnews" user="root"  password="golutron"/>
 <c:choose>
 <c:when test="${not empty param.first_name && not empty param.last_name && not empty param.username  && not empty param.password && not empty param.roll_no && not empty param.fe_marks && not empty param.se_marks && not empty param.te_marks && not empty param.branch && not empty param.backlogs}">   
    <sql:update dataSource="${snapshot}" var="count">
      INSERT INTO userinfo(first_name,last_name,username,password,roll_no,fe_marks,se_marks,te_marks,branch,backlogs,email) VALUES (?,?,?,?,?,?,?,?,?,?,?)
      <sql:param value="${param.first_name}"/>
      <sql:param value="${param.last_name}"/>
      <sql:param value="${param.username}"/>
      <sql:param value="${param.password}"/>
      <sql:param value="${param.roll_no}"/>
      <sql:param value="${param.fe_marks}"/>
      <sql:param value="${param.se_marks}"/>
      <sql:param value="${param.te_marks}"/>
      <sql:param value="${param.branch}"/>
      <sql:param value="${param.backlogs}"/>
      <sql:param value="${param.email}"/>
      
    </sql:update>
    <script>
      alert('Success!! Your account has been created.');
      window.location='home.jsp';
    </script>
 </c:when>
 <c:otherwise>
   
       
 </c:otherwise>
</c:choose>
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
</body>

  </html>
