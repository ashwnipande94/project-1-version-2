<%@ include file="header.jsp" %>

    <title>Category</title>
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
       
                   
.blue-button{  
    background: #77EAE7;  
    filter: progid: DXImageTransform.Microsoft.gradient( startColorstr='#25A6E1',endColorstr='#188BC0',GradientType=0);  
    padding:3px 5px;  
    color:#fff;  
    font-family:'Helvetica Neue',sans-serif;  
    font-size:12px;  
    border-radius:2px;  
    -moz-border-radius:2px;  
    -webkit-border-radius:4px;  
    border:1px solid #1A87B9  
}       
table {  
  font-family: "Helvetica Neue", Helvetica, sans-serif;  
   width: 50%;  
}  
 td,th{  
                border: 1px solid gray;  
                width: 25%;  
                text-align: left;  
                padding: 5px;  
                 background: #F78B8B
            }  
            
               .errors{
       
       color:red;
       font-style:italic;
       }     

        
        
</style>
    </head>
    
   <body>
   
   
 <div class = "container">
	<div class="wrapper">
		     
 <form:form  method="POST" modelAttribute="category" class="form-signin"  action="addCategory">        
		       
   <h3 class="form-signin-heading"> Category </h3>
   <hr class="colorgraph"><br>
  	
  	
  	
	
  		  
 Category Id  :        <form:input type="hidden" class="form-control" path="categoryId" placeholder="categoryId"  /><br><br>
 Category Name :       <form:input type="text" class="form-control" path="categoryName" placeholder="categoryName" /> <br><br>
 <form:errors path="categoryName"  class="form-control" id="inputError"></form:errors>    		  
 Category Description : <form:input type="text" class="form-control" path="categoryDescription" placeholder="categoryDescription" /><br><br>
 <form:errors path="categoryDescription"  class="form-control" id="inputError"></form:errors>
   
<div ng-app="app" ng-controller="myCtrl">
<div class="alert alert-info">
<p>Search Query:{{searchCategory}}</p>
<input type="text" placeholder="Search the category" ng-model="searchCategory">
</div>
</div><br>

  				
			
			
<div class="offset-sm-2 col-sm-10">
                  <input type="submit" value="addCategory" class="btn btn-primary"/>
  </div>      			
  </form:form>
 </div>
 
 
 <div class="table-responsive">
    <table class="table">  
    <caption><h2>Category List</h2></caption>
    <thead class="thead-default">
        <th>category Id</th>  
        <th>Category Name</th>  
        <th>category description</th>  
        <th >Edit</th>  
        <th>Delete </th>  
        </thead>
         
     <tbody>
   
        
        <br>
        <tr ng-repeat="clist in jsonData | orderBy:sortType:sortReverse | filter:searchCategory">  
            <td>{{clist.categoryId}}</td>  
            <td>{{clist.categoryName}}</td>  
            <td>{{clist.categoryDescription}}</td>  
            <td><a href="editCategory-{{clist.categoryId}}">Edit</a></td>  
            <td><a href="deleteCategory-{{clist.categoryId}}">Delete</a></td> 
</tr>  
</tbody>
    </table> 
    </div>
    
    
    <script type="text/javascript">
    var app=angular.module('app',[]);
    app.controller("myCtrl",function ($scope){
    	$scope.sortType      = 'categoryName';
    	$scope.sortReverse   = false;
    	$scope.searchCategory  ='';
   $scope.jsonData=${categoryList};
    });

  </script>
    
</div>
</body>
</html>
<%@ include file="footer.jsp" %>