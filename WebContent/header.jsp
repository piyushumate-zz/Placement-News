<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
	  
	 
	
  </head>

		<div class ="navbar-wrapper">

			<div class="container">
				<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
					<div class="container">
						<div class="navbar-header">
							<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
							   <span class="sr-only">Toggle Navigation</span>
							   <span class="icon-bar"></span>
							   <span class="icon-bar"></span>
							   <span class="icon-bar"></span>
							</button>

							<a class="navbar-brand" href="#">Placement News
							</a>
						</div>
						  <div class="navbar-collapse collapse">
						  <c:if test="${empty sessionScope['username']}">
    					    <form class="navbar-form navbar-right"  role="form" action="home.jsp" method="POST">
            					<div class="form-group">
              						<input type="text" name="username" placeholder="Username" class="form-control">
            					</div>
           						<div class="form-group">
              						<input type="password" name="password"  placeholder="Password" class="form-control">
           						</div>
            					<button type="submit" class="btn btn-success">Sign in</button>
          					</form>
                          </c:if>
                          <c:if test="${not empty sessionScope['username'] }">
                            <form class="navbar-form navbar-right" role="form" action="logout.jsp" >
            				    <font color="white">Welcome,<c:out value="${sessionScope['username']}" /> &nbsp; &nbsp; </font>   				       
            		            <button type="submit" class="btn btn-danger">Log Out</button>             		                              
                            </form>
                            <ul class="nav navbar-nav navbar-left">
        						<li><a href="companies.jsp">Companies</a></li>
        						<li><a href="comingsoon.jsp">Home</a></li>
								        						
        						<c:if test="${sessionScope.username == 'admin'}">
                                  <li class="dropdown">
                                  <a href="#" class="dropdown-toggle" data-toggle="dropdown">Control<span class="caret"></span></a>
                                  <ul class="dropdown-menu" role="menu">
                                  <li><a href="notify.jsp">Notify</a></li>
           						  <li><a href="#">Add new company</a></li>
            					 
                                 </ul>
                                 </li>
                                </c:if>
        					</ul>
                          </c:if>
						  </div>

					</div>
				</div>
			</div>
	  	</div>
	  	
</html>