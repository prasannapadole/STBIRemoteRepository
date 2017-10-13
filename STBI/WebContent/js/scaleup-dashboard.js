angular.module("scaleupDashboard",[]).controller("scaleupctrldashboard", function($scope){
	 $scope.today = new Date();
	 $scope.rating = 5;
	 
	 $scope.emailid = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	 $scope.mobiles = /^(\+\91{1,2}[- ])\d{10}$/;
	 $scope.landline = /^[0-9]\d{2,5}-\d{6,8}$/;
	 $scope.numberonly = /^[0-9]{1,6}$/;
	 $scope.stringonly = /^[a-zA-Z ]{1,25}$/;
	 $scope.ages = /^[0-9]{1,2}$/;
	 $scope.dateformat = /^[0,1]?\d{1}\/(([0-2]?\d{1})|([3][0,1]{1}))\/(([1]{1}[9]{1}[9]{1}\d{1})|([2-9]{1}\d{3}))$/ ;
		 
		
	 
	 $scope.products = [];
     $scope.addItem = function () {
         $scope.errortext = "";
         if (!$scope.addMe) {return;}        
         if ($scope.products.indexOf($scope.addMe) == -1) {
             $scope.products.push($scope.addMe);
             $scope.addMe='';
             
         } else {
             $scope.errortext = "The item is already in your list.";
             $scope.addMe='';
         }
     }
     $scope.removeItem = function (x) {
         $scope.errortext = "";    
         $scope.products.splice(x, 1);
     }
});