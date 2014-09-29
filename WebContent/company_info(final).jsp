<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
      <s:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/placementnews"
     user="root"  password="golutron"/>
     
     <s:query dataSource="${snapshot}" var="flname">
       select first_name,last_name,email from userinfo where username="${sessionScope['username']}"; 
    </s:query>
          <c:set scope="session" var="first_name" value="${flname.rowsByIndex[0][0]}"/>
          <c:set scope="session" var="last_name" value="${flname.rowsByIndex[0][1]}"/>
          <c:set scope="session" var="email" value="${flname.rowsByIndex[0][2]}"/>
               
              
      <s:query dataSource="${snapshot}" var="res2">
       select arrival_date from companies where DATEDIFF(arrival_date,DATE(now())) > 6 AND company_id= ${sessionScope['company_id']} ; 
      </s:query>
    
   
     <s:query dataSource="${snapshot}" var="res">
       select arrival_date from companies where DATEDIFF((arrival_date),DATE(now())) between 2 AND 6 AND company_id= ${sessionScope['company_id']} ; 
     </s:query>
              
               
              <c:choose>
	            <c:when test="${res.rowCount == 1}">
	                <s:query dataSource="${snapshot}" var="r">
                       select * from userinfo where username= "${sessionScope['username']}" AND (fe_marks+se_marks+te_marks)/3 >= (select aggregate from companies where company_id=  ${sessionScope['company_id']}) AND backlogs<=(select backlog from companies where company_id= ${sessionScope['company_id']}); 
                   </s:query>
                   <c:choose>
                        <c:when test="${r.rowCount == 1}">
             
                         
	                     <s:update dataSource="${snapshot}" var="createtable">
	                        create table if not exists `${sessionScope['company_name']}` (reg_no int(11) NOT NULL AUTO_INCREMENT,first_name varchar(100) NOT NULL,last_name varchar(100) NOT NULL,PRIMARY KEY(reg_no));	                     
	                     </s:update>
	                    <s:update dataSource="${snapshot}" var="insertinto">
	                    insert into `${sessionScope['company_name']}` (first_name,last_name) select * from (select '${sessionScope['first_name']}', '${sessionScope['last_name']}') AS tmp where not exists ( SELECT first_name FROM `${sessionScope['company_name']}` WHERE first_name='${sessionScope['first_name']}' AND last_name='${sessionScope['last_name']}') LIMIT 1;
	                    </s:update>
	                          <c:if test="${insertinto == 0}">
	                            <script>
	                             alert("You have already Registered!!!");
	                             window.location='companies.jsp';
	                           </script>
	                         </c:if>       
	                          
	                          <c:if test="${insertinto ==1}">
	                    
	                           <c:redirect url="../PlacementNews/SendMail"/>              
	                            
	                         </c:if>       
	                    
	                    </c:when>
	                     
	                  <c:otherwise>
	                     <script>
	                     alert("You are not eligible for this company!");
	                     window.location = 'company_info.jsp?company_id= <%= session.getAttribute("company_id") %>';
	   		             </script>
	                     
	                 </c:otherwise>
	              </c:choose>
	            </c:when>
	            
	            <c:when test ="${res2.rowCount == 1}">
	                        <script>
	                             alert("The registrations have not opened up!!");
	                             window.location='companies.jsp';
	                        </script>
	            </c:when>
	            
	            <c:otherwise>
	               <script>
	               alert("Registration closed");
	               window.location = 'company_info.jsp?company_id= <%= session.getAttribute("company_id") %>';
		           </script>
	               
	            </c:otherwise>
	         </c:choose>
	 
	


</body>
</html>