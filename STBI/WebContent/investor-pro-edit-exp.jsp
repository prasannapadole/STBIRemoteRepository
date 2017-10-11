<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>
   		 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
    </head>
	<body>
		 <div style="padding: 30px;">
		 	<form name="profForm">
					  <div class="form-group">
					    <label for="inputsm">Designation</label>
					    <input class="form-control input-sm" id="inputsm" type="text" name="designation" ng-model="designation" required>
					  </div>
					 <div class="form-group">
					    <label for="inputsm">Company Name</label>
					    <input class="form-control input-sm" id="inputsm" type="text" name="cname" ng-model="cname" required/>
					  </div>
					 <div class="form-group">
					    <label for="inputsm">Location</label>
					    <input class="form-control input-sm" id="inputsm" type="text" name="location" ng-model="location" required/>
					  </div>
					   <div class="row form-group">
					      <label for="inputsm" style="padding-left: 15px;">Time Period</label><br>
						  <div class=" col-sm-6">
						    <label for="inputsm"><small>From (Format : MM/DD/YYYY)</small></label>
						    <input class="form-control input-md" id="inputsm" type="text" name="from" ng-model="from" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
						      <span style="color:red" ng-show="profForm.from.$dirty && profForm.from.$invalid">
						      <span ng-show="profForm.from.$error.required">Please specify Date</span></span>
							  <span ng-show="profForm.from.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
						  </div>
						  <div class=" col-sm-6">
						    <label for="inputsm"><small>To (Format : MM/DD/YYYY)</small></label>
						    <input class="form-control input-md" id="inputsm" type="text" name="to" ng-model="to" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
							  <span style="color:red" ng-show="profForm.to.$dirty && profForm.to.$invalid">
						      <span ng-show="profForm.to.$error.required">Please specify Date</span></span>
							  <span ng-show="profForm.to.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
						  </div>
					  </div>
					  <div class="form-group">
					    <label for="inputsm">Description</label>
					    <textarea rows="" cols="" class="form-control"></textarea>
					  </div>
					  <div class="form-group fload_right">
					    	<button type="submit" class="btn btn-info btn-md active"
					    	        ng-disabled="profForm.from.$dirty && profForm.from.$invalid && profForm.from.$error.pattern ||
					    	         	profForm.to.$dirty && profForm.to.$invalid && profForm.to.$error.pattern"
					    	>Save</button>
					    	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					  </div>
				</form> 
		 </div>
	</body>
</html>