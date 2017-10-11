<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<body >
		<form name="">
		  <div style="padding: 30px;">
				  <div class="form-group">
				    <label for="inputsm">Add Skills</label>
				    <input class="form-control input-md" id="inputsm" type="text" name="skills" ng-model="skills" required/>
				  </div>
				  <div class="form-group fload_right">
				    	<button type="submit" class="btn btn-info btn-md active">Save</button>
				    	 <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				  </div>
		  </div>
		</form> 
	</body>
</html>