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

		function validateForm(){
			return true;
		}

		// buttons
		$scope.submit = function () {
			//$scope.isSubmitted = true;

			if($scope.customer && validateForm()){
				//$scope.isSubmitting = true;
				// $timeout(function(){
				// 	console.log('timeout.....');
				// 	console.log($scope.customer);
				// 	$scope.isSubmitted = false;
				// 	$scope.isSubmitting = false;
				// }, 5000);
				customerService.update($scope.customer).then(function(result){
					$scope.messageSuccess = result.message;
					//resetFormStatus();
				}, function(error){
					$scope.messageError = error.message;
					// resetFormStatus();
				})
			}					
		}

		$scope.cancel = function() {
            $state.go($state.current.parentState);
        }
		
		/* start */
		activate();
	}
})();