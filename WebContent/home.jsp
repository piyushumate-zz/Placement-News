<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<!DOCTYPE html>
<html>
  <head>
     <meta name="viewport" content="width=device-width,initial scale=1">
     <meta name="description" content="">
     <meta name="author" content="golutron">
     <link rel="shortcut icon" href="favicon.ico">

     <title>Placement News</title>

     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>

     <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />

     <link href='http://fonts.googleapis.com/css?family=Pacifico' rel='stylesheet' type='text/css'>
	  
	 
	 <link rel="stylesheet" href="home.css"/>
     
  </head>
  <body>
     <%@include file="header.jsp"%>      	
    
    <c:if test="${not empty param.username and not empty param.password}">
      <s:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
                       url="jdbc:mysql://localhost/placementnews"
                       user="root" password="golutron"/>
      
      <s:query dataSource="${snapshot}" var="res">
        select * from userinfo where username='${param.username}' and password='${param.password}'
      </s:query>
 
      
        <c:choose>
          <c:when test="${res.rowCount==1}">
             <c:set scope="session"
                   var="username"
                   value="${param.username}"/>
             
            <c:redirect url="home.jsp"/>
          </c:when>
          <c:otherwise>
              <script>
                   alert("Username & Password do not match!!!");   
              </script>
           
         </c:otherwise>
        </c:choose>
 
 
    </c:if>
 
 

<c:if test="${sessionScope.username == null}">
     <a href="signup.jsp" class="action-button shadow animate blue">Sign Up</a>
</c:if>


   
  
  <script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


	
  </body>
</html>
