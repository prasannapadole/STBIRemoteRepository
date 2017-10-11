<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
   		 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.2/angular.min.js"></script>
    </head>
	<body >
		<form name="educationForm">
		  <div style="padding: 30px;">
				  <div class="form-group">
				    <label for="inputsm">School / College Name</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="name" ng-model="name" required/>
				  </div>
				 <div class="form-group">
				    <label for="inputsm">Degree</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="degree" ng-model="degree" required/>
				  </div>
				 <div class="form-group">
				    <label for="inputsm">Field of Study</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="field" ng-model="field" required/>
				  </div>
				  <div class="form-group">
				    <label for="inputsm">Grade</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="grade" ng-model="grade" required/>
				  </div>
				  <div class="row form-group">
				      <label for="inputsm" style="padding-left: 15px;">Time Period</label><br>
					  <div class=" col-sm-6">
					    <label for="inputsm"><small>From (Format : MM/DD/YYYY)</small></label>
					    <input class="form-control input-md" id="inputsm" type="text" name="from" ng-model="from" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
					      <span style="color:red" ng-show="educationForm.from.$dirty && educationForm.from.$invalid">
					      <span ng-show="educationForm.from.$error.required">Please specify Date</span></span>
						  <span ng-show="educationForm.from.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
					  </div>
					  <div class=" col-sm-6">
					    <label for="inputsm"><small>To (Format : MM/DD/YYYY)</small></label>
					    <input class="form-control input-md" id="inputsm" type="text" name="to" ng-model="to" ng-pattern="/^(0?[1-9]|1[012])\/(0?[1-9]|[12][0-9]|3[01])\/(199\d)|([2-9]\d{3})$/" required/>
						  <span style="color:red" ng-show="educationForm.to.$dirty && educationForm.to.$invalid">
					      <span ng-show="educationForm.to.$error.required">Please specify Date</span></span>
						  <span ng-show="educationForm.to.$error.pattern" style="color:red"> Incorrect Format, should be MM/DD/YYYY.</span>
					  </div>
				  </div>
				  <div class="form-group">
				    <label for="inputsm">Description</label>
				    <textarea rows="" cols="" class="form-control" name="description"/></textarea>
				  </div>
				  <div class="form-group fload_right">
				    	<button type="submit" class="btn btn-info btn-md active "
				    			ng-disabled="educationForm.from.$dirty && educationForm.from.$invalid && educationForm.from.$error.pattern 
				    			|| educationForm.to.$dirty && educationForm.to.$invalid && educationForm.to.$error.pattern"
				    	>Save</button>
				    	 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				  </div>
			</div>
		</form> 
	</body>
</html>