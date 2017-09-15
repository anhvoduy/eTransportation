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
					$scope.groupPermission = result;
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
			if(!master || !Array.isArray(master)){
				return false;
			}			
			else{
				return true;
			}			
		}
		// buttons
		$scope.submit = function (groupPermission) {
			$scope.isSubmitted = true; // validate UI			
			if(!$scope.groupPermission || !validateMaster($scope.groupPermission)) // validate business rules
			{ 
				$scope.isSubmitted = false;
				return;
			}
			// start submit to server
			$scope.isSubmitting = true;			
			groupService.assignPermission($scope.groupPermission).then(function(result){
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
		
		$scope.linkUser = function(){
			console.log('link User.....');
		}
		
		/* start */
		activate();
	}
})();