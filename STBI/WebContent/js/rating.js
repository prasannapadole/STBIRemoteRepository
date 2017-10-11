angular.module("instiDashboard",[]).controller("instictrldashboard", function($scope){
	 $scope.today = new Date();
	 $scope.rating = 5;
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
     
     $scope.rate = 7;
     $scope.max = 10;
     $scope.isReadonly = false;
     $scope.ratingStates = [
       {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
       {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
       {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
       {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'},
       {stateOn: 'glyphicon-star', stateOff: 'glyphicon-star-empty'}
     ];
     $scope.y=0;
     $scope.odlY=0;
});