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

<form class="sign-up" action="company_info(final).jsp">
    
<c:forEach var="row" items="${result.rows}">
   <h1 class="sign-up-title" style="font-family:Georgia"><strong>${row.company_name}</strong></h1>
	
	<center><a href="http://${row.company_website}"> <img src="${row.company_logo}" class="img-thumbnail"> </a></center>
    <center><h1 style="font-family:Georgia"><strong>Details</strong></h1></center>
    
    
    <center><h4 style="font-family:Georgia"><strong>Package</strong> - ${row.ctc} LPA </h4></center>
	<center><h4 style="font-family:Georgia"><strong>Arrival Date</strong> - ${row.arrival_date} </h4></center>
	<center><h4 style="font-family:Georgia"><strong>Reporting Time</strong> - ${row.reporting_time} </h4></center>
	<center><h4 style="font-family:Georgia"><strong>Backlogs</strong> - ${row.backlog} </h4></center>
	<center><h4 style="font-family:Georgia"><strong>Aggregate</strong> - ${row.aggregate} </h4></center>
	<center><h4 style="font-family:Georgia"><strong>Year Gap</strong> - ${row.gap} </h4></center>
    
</c:forEach>
   	<c:if test="${sessionScope.username != null}">
   	    <s:query dataSource="${snapshot}" var="res">
                   select * from companies where company_id= ${sessionScope['company_id']} AND arrival_date< DATE(NOW()); 
        </s:query>
   	    <c:if test="${res.rowCount == 0}">
   	      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
   	      <button type="submit" class="btn btn-primary">Apply</button>
        </c:if>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <s:query dataSource="${snapshot}" var="r">
                   select count(*) from companies where company_id= ${sessionScope['company_id']} AND arrival_date< DATE(NOW()); 
        </s:query>
   	      <c:if test="${r.rowsByIndex[0][0]==0}">
              <a href="applicant_list.jsp"><button type="button" class="btn btn-success">Students who applied</button></a>
          </c:if>
    </c:if>
</form>
	
	   
	      
  
 </body>
</html>