(function () {
	'use strict';
	app.controller('customerEditController', customerEditController);
	customerEditController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', '$timeout', 'appCommon', 'customerService'];
	function customerEditController($rootScope, $scope, $state, $stateParams, $timeout, appCommon, customerService) {
		// models
		$scope.isSubmitted = false;
		$scope.isSubmitting = false;
		$scope.customerKey = $stateParams.customerKey;
		$scope.formStatus = $stateParams.formStatus;
		$scope.formStatus = appCommon.isUndefined($scope.customerKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;

		// function
		function activate() {
			setFormTitle();
			if($scope.formStatus === appCommon.formStatus.isNew) return;

			customerService.getItem($scope.customerKey).then(function (result) {
				$scope.customer = result;
				if (angular.isUndefined($scope.customer)) {
					$scope.messageErrorCustomer = String.format("The Customer Key: {0} not found.", $scope.customerKey);
					$scope.disabledButton = true;
				} else{
					$scope.disabledButton = false;
				}
			}, function (error) {
				$scope.messageErrorCustomer = error.message;
				$scope.disabledButton = true;
			});
		}

		function setFormTitle(){
			if($scope.formStatus === appCommon.formStatus.isNew)
				$scope.formTitle = 'Create Customer';
			else if ($scope.formStatus === appCommon.formStatus.isEdit)
				$scope.formTitle = 'Edit Customer';
			else
				$scope.formTitle = 'Display Customer';
		};

		function validateMaster(master){
			if(!master){
				return false;
			}
			else if(angular.isUndefined(master.CustomerName) || formCustomer.CustomerName.$invalid){
				return false;
			}
			else if(angular.isUndefined(master.Email) || formCustomer.Email.$invalid){
				return false;
			}
			else{
				return true;
			}			
		}
		// buttons
		$scope.submit = function (customer) {
			$scope.isSubmitted = true; // validate UI
			$scope.master = angular.copy(customer); // clone new object
			if(!$scope.master || !validateMaster($scope.master)) // validate business rules
			{ 
				$scope.isSubmitted = false;
				return;
			}
			// start submit to server
			$scope.isSubmitting = true;			
			customerService.update($scope.master).then(function(result){
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