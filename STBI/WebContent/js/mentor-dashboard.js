angular.module("mentorDashboard",[]).controller("mentorctrldashboard", function($scope){
	 $scope.today = new Date();
	 $scope.rating = 5;
	 
	 $scope.emailid = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
     $scope.mobiles = /^(\+\91{1,2}[- ])\d{10}$/;
     $scope.landline = /^[0-9]\d{2,5}-\d{6,8}$/;
     $scope.numberonly = /^[0-9]{1,6}$/;
     $scope.stringonly = /^[a-zA-Z ]{1,25}$/;
     $scope.ages = /^[0-9]{1,2}$/;
     $scope.debitcard = /^[0-9]{16,16}$/;
     $scope.cvvs = /^[0-9]{3,3}$/;
     $scope.pincodes = /^[0-9]{6,6}$/;
     $scope.adhar = /^[0-9]{12,12}$/;
     $scope.processDate = function(dt)
     {
       return $filter('date')(dt, 'dd/MM/yyyy');
     }
     
	 $scope.rateFunction = function(rating) { };
	 $scope.setFile = function(element) {
         $scope.$apply(function($scope) {
             $scope.theFile = element.files[0];
             $scope.FileMessage = '';
             var filename = $scope.theFile.name;
             console.log(filename.length)
             var index = filename.lastIndexOf(".");
             var strsubstring = filename.substring(index, filename.length);
             if (strsubstring == '.pdf' || strsubstring == '.doc')
             {
               console.log('File Uploaded sucessfully');
             }
             else {
                 $scope.theFile = '';
                   $scope.FileMessage = 'please upload correct File Name, File extension should be .pdf, .doc or';
             }
         });
     };
     
});