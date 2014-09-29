<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link href='http://fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css'>
  <link rel="stylesheet" href="company_info.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>
  
</head>

<body>
  <%@include file="header.jsp" %>      	
  
	
     
  <br><br><br>
 
  <s:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/placementnews"
     user="root"  password="golutron"/>
    <c:set scope="session" var="company_id" value='<%=request.getParameter("company_id") %>'/>
    <c:set scope="session" var="company_name" value='<%=request.getParameter("company_name")%>'/>
<s:query dataSource="${snapshot}" var="result">
select * from companies where company_id=<%= request.getParameter("company_id") %> ;
</s:query>

<form class="sign-up" action="NotifyMail">
    
<c:forEach var="row" items="${result.rows}">
   <h1 class="sign-up-title" style="font-family:Georgia"><strong>${row.company_name}</strong></h1>
	
	<center><a href="http://${row.company_website}"> <img src="${row.company_logo}" class="img-thumbnail"> </a></center>
</c:forEach>
<br><br>
<center><button type="submit" class="btn btn-danger">Notify Everyone</button></center>
 
</form>

<s:query dataSource="${snapshot}" var="result">
select email from userinfo;
</s:query>

 
              
</body>
</html>	