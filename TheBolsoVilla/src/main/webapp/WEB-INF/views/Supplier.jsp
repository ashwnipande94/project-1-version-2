<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
    <%@ page isELIgnored="false" %>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

    <title>Supplier</title>
    <style>
        
     .wrapper {    
	margin-top: 80px;
	margin-bottom: 20px;
}

.form-signin {
  max-width: 420px;
  padding: 30px 38px 66px;
  margin: 0 auto;
  background-color: #eee;
  border: 3px dotted rgba(0,0,0,0.1);  
  }

.form-signin-heading {
  text-align:center;
  margin-bottom: 30px;
}

.form-control {
  position: relative;
  font-size: 16px;
  height: auto;
  padding: 10px;
}

input[type="text"] {
  margin-bottom: 0px;
  border-bottom-left-radius: 0;
  border-bottom-right-radius: 0;
}

input[type="password"] {
  margin-bottom: 20px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}

.colorgraph {
  height: 7px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}   
        
        
</style>
    </head>
    
   <body>
   
   


 <div class = "container">
	<div class="wrapper">
		     
 <form:form  method="POST" name="supplier" class="form-signin"  action="addSupplier">        
		       
   <h3 class="form-signin-heading"> Supplier </h3>
   <hr class="colorgraph"><br>
  	
	
  
  		  
 Supplier Id  :        <form:input type="number" class="form-control" path="supplierId" placeholder="supplierId"  /><br><br>
 Supplier Name :       <form:input type="text" class="form-control" path="supplierName" placeholder="supplierName" /> <br><br>
 <form:errors path="supplierName"  class="form-control" id="inputError"></form:errors>    		  
 Supplier Contact : <form:input type="text" class="form-control" path="supplierContact" placeholder="supplierContact" /><br><br>
 <form:errors path="supplierContact"  class="form-control" id="inputError"></form:errors> 
 Supplier Address : <form:input type="text" class="form-control" path="supplierAddress" placeholder="supplierAddress" /><br><br>
 
  <div ng-app="app" ng-controller="myCtrl">
<div class="alert alert-info">
<p>Search Query:{{searchSupplier}}</p>
<input type="text" placeholder="Search the category" ng-model="searchSupplier">
</div>
</div><br> 
			
<div class="offset-sm-2 col-sm-10">
                  <input type="submit" value="addSupplier" class="btn btn-primary"/>
  </div>      			

 </form:form>>
 </div>
 
 
 <div class="table-responsive">
    <table class="table">  
    <caption>Supplier List</caption>
    <thead class="thead-default">
        <th>Supplier Id</th>  
        <th>Supplier Name</th>  
        <th>Supplier Contact</th>
        <th>Supplier Address</th>  
        <th >Edit </th>  
        <th>Delete </th>  
        </thead>
         
     <tbody>
   
        
        <br>
        <tr ng-repeat="slist in jsonData|orderBy:sortType:sortReverse|filter:searchBrand">  
            <td>{{slist.supplierId}}</td>  
            <td>{{slist.supplierName}}</td>  
            <td>{{slist.supplierContact}}</td>  
            <td>{{slist.supplierAddress}}</td>
            <td><a href="editSupplier-{{clist.supplierId}}">Edit</a></td>  
            <td><a href="deleteSupplier-{{clist.supplierId}}">Delete</a></td> 
</tr>  
</tbody>
    </table> 
    </div>
    
    <script type="text/javascript" src="resources/angular.min.js"></script>
    <script type="text/javascript">
    var app=angular.module('app',[]);
    app.controller("myCtrl",function ($scope){
    	$scope.sortType      = 'supplierName';
    	$scope.sortReverse   = false;
    	$scope.searchSupplier  ='';
   $scope.jsonData=${supplierList};
    });

  </script>
    
</div>
</body>
</html>