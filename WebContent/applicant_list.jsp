<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"/>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${company_name} Registrations</title>
</head>
<body>

  <s:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/placementnews"
     user="root"  password="golutron"/>
  <center><h1><strong>${company_name} Registrations</strong></h1></center>
  <br><br>
  <s:query dataSource="${snapshot}" var="r">
    SELECT count(*) FROM information_schema.tables WHERE table_schema = 'placementnews' AND table_name = '${company_name}';
  </s:query>
 <c:if test="${r.rowsByIndex[0][0]==1}">
    <s:query dataSource="${snapshot}" var="result">
    select * from `${company_name}`; 
    </s:query>
   <table class="table table-hover">
   <tr>
     <th>Registration_No</th>
     <th>First Name</th>
     <th>Last Name</th>
   </tr>
   <c:forEach var="row" items="${result.rows}">
   <tr>
     <td><c:out value="${row.reg_no}"/></td>
     <td><c:out value="${row.first_name}"/></td>
     <td><c:out value="${row.last_name}"/></td>
   </tr>
   </c:forEach>
   </table>
 </c:if>
  <c:if test="${r.rowsByIndex[0][0]==0}">
     <script>
       alert("No registrations yet!!");
       window.location='companies.jsp';
     </script>
  </c:if>
</body>
</html>