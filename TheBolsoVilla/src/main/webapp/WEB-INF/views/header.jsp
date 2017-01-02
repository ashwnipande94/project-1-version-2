<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ page isELIgnored="false" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/bootstrap.min.css" type="text/css"></link>
<script src="resources/js/jquery.min.js" type="text/javascript"></script>
  <script src="resources/js/bootstrap.min.js" type="text/javascript"></script>
  <link href="resources/css/font-awsome.min.css" rel="stylesheet"></link>
<link href="resourses/js/angular.min.js" type="text/javascript"></link>
<title>Insert title here</title>
<style>
 body {
    background-color: #9F2323;
}
</style>


</head>
<body>

<sec:authorize access="isAuthenticated()">
 <sec:authentication property="principal.Username"/>
 Dear <strong>$(username)</strong>,Welcome to Admin Page.
 <a href="<c:url value="/logout"/>">Logout</a>
 </sec:authorize>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">TheBolsoVilla</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
 <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Home <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="category"> Category</a></li>
            <li><a href="Subcategory"> Subcategory</a></li>
            <li><a href="brand">Brand</a></li>
            <li><a href="product">Product</a></li>
            <li><a href="supplier">Supplier]</a></li>
          </ul>
        </li>
       
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Bags <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="men"> Men</a> </li>
            <li><a href="women"> Women</a></li>
           
          </ul>
        </li>
        <li><a href="#" >My Cart <img src="resources/images/cart.png" style="width:30px;height:30px;"></a></li>
        
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li><a href="loginpage"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
 </body>