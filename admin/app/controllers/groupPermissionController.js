(function () {
	'use strict';
	app.controller('groupPermissionController', groupPermissionController);
	groupPermissionController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', '$timeout', 'appCommon', 'groupService'];
	function groupPermissionController($rootScope, $scope, $state, $stateParams, $timeout, appCommon, groupService) {
		// models
		$scope.isSubmitted = false;
		$scope.isSubmitting = false;
		$scope.groupKey = $stateParams.groupKey;
		$scope.formStatus = $stateParams.formStatus;
		$scope.formStatus = appCommon.isUndefined($scope.groupKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;
		$scope.messageSuccess = [];
		$scope.messageError = [];

		// function
		function activate() {
			setFormTitle();
			if($scope.formStatus === appCommon.formStatus.isNew) return;
			
			if(!appCommon.isUndefined($scope.groupKey)){
				groupService.getPermission($scope.groupKey).then(function(result){
					$scope.permission = result;
				}, function(error){
					$scope.messageError.push(error);
				});
			}
		}
		
		function setFormTitle(){
			if($scope.formStatus === appCommon.formStatus.isNew)
				$scope.formTitle = 'Create Group';
			else if ($scope.formStatus === appCommon.formStatus.isEdit)
				$scope.formTitle = 'Edit Group';
			else
				$scope.formTitle = 'Display Group';
		};

		function validateMaster(master){
			if(!master){
				return false;
			}
			else if(angular.isUndefined(master.GroupName) || formGroup.GroupName.$invalid){
				return false;
			}
			else{
				return true;
			}			
		}
		// buttons
		$scope.submit = function (group) {
			$scope.isSubmitted = true; // validate UI
			$scope.master = angular.copy(group); // clone new object
			if(!$scope.master || !validateMaster($scope.master)) // validate business rules
			{ 
				$scope.isSubmitted = false;
				return;
			}
			// start submit to server
			$scope.isSubmitting = true;			
			groupService.update($scope.master).then(function(result){
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