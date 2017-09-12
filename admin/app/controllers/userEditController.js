(function () {
	'use strict';
	app.controller('userEditController', userEditController);
	userEditController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', '$timeout', 'appCommon', 'userService'];
	function userEditController($rootScope, $scope, $state, $stateParams, $timeout, appCommon, userService) {
		// models
		$scope.isSubmitted = false;
		$scope.isSubmitting = false;
		$scope.userKey = $stateParams.userKey;
		$scope.user = {};
		$scope.formStatus = $stateParams.formStatus;
		$scope.formStatus = appCommon.isUndefined($scope.userKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;
		$scope.messageSuccess = [];
		$scope.messageError = [];		

		// function
		function activate() {
			setFormTitle();
			if($scope.formStatus === appCommon.formStatus.isNew) return;

			if(!appCommon.isUndefined($scope.userKey)){
				userService.getItem($scope.userKey).then(function (result) {
					$scope.user = result;					
				}, function (error) {
					$scope.messageError.push(error);
				});
			}			
		}

		function setFormTitle(){
			if($scope.formStatus === appCommon.formStatus.isNew)
				$scope.formTitle = 'Create User';
			else if ($scope.formStatus === appCommon.formStatus.isEdit)
				$scope.formTitle = 'Edit User';
			else
				$scope.formTitle = 'Display User';
		};

		function validateMaster(master){
			if(!master){
				return false;
			}
			else if(angular.isUndefined(master.UserName) || formUser.UserName.$invalid){
				return false;
			}
			else if(angular.isUndefined(master.Email) || formUser.Email.$invalid){
				return false;
			}
			else{
				return true;
			}			
		}



		// buttons
		$scope.submit = function (user) {
			$scope.isSubmitted = true; // validate UI
			$scope.master = angular.copy(user); // clone new object
			if(!$scope.master || !validateMaster($scope.master)) // validate business rules
			{ 
				$scope.isSubmitted = false;
				return;
			}
			// start submit to server
			$scope.isSubmitting = true;			
			userService.update($scope.master).then(function(result){
				//console.log(result);
				if($scope.formStatus === appCommon.formStatus.isNew){
					$state.go($state.current.parentState);
				} else if($scope.formStatus === appCommon.formStatus.isEdit){
					$scope.isSubmitted = false;
					$scope.isSubmitting = false;
				}
			}, function(error){
				//console.log(error);
				$scope.isSubmitted = false;
				$scope.isSubmitting = false;				
			});			
		}

		$scope.cancel = function() {
            $state.go($state.current.parentState);
        }
		
		/* start */
		activate();
	}
})();