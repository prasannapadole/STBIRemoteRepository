<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="scaleupDashboard" ng-controller="scaleupctrldashboard">
	<head>
	    <title>Scaleup Hackathons Response</title>
	    <meta charset="utf-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	    <link rel="stylesheet" href="css/scaleupdashboard.css">
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
	    <script src="js/scaleup-dashboard.js"></script>
	    <script src="js/city-navbar.js"></script>
    </head>
	<body>
		<div ng-include="'scaleup-navbar.jsp'"></div>
		<div class="container">
			<div class="top">
			    <h3 class="text-center">Responses</h3><hr>
				<table class="table table-hover">
				    <thead>
				      <tr> 
				        <th class="table-fent-gray">Applicant Name</th>
				        <th class="table-dark-gray">Mobile Number</th>
				        <th class="table-fent-gray">Email Id</th>
				        <th class="table-dark-gray"></th>
				      </tr>
				    </thead>
				    <tbody>
				      <tr>
				        <td><p class="text-center">John Deo</p></td>
				        <td><p class="text-center">8796543312</p></td>
				        <td><p class="text-center">john@example.com</p></td>
				        <td><p class="text-center"><button class="btn btn-info btn-xs active ">View</button></p></td>
				      </tr>
				    </tbody>
				  </table>
			</div>
		</div>
	</body>
</html>