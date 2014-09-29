<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Notify</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>

<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" />

<link rel="stylesheet" href="companies.css"/>

</head>
<body>
     <%@include file="header.jsp" %>      	

<br><br><br><br><br>
<h2 class="lined-heading">
<span>Upcoming Companies</span></h2>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/placementnews"
     user="root"  password="golutron"/>
 
<sql:query dataSource="${snapshot}" var="result">
select * from companies where arrival_date >= DATE(NOW());
</sql:query>
<c:forEach var="row" items="${result.rows}">
    <a href="company_notify.jsp?company_id=${row.company_id}&company_name=${row.company_name}"><img src="${row.company_logo}" class="img-thumbnail"></a>&nbsp;
</c:forEach>


</body>
</html>