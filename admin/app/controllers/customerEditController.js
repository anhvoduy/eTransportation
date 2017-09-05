(function () {
	'use strict';
	app.controller('customerEditController', customerEditController);
	customerEditController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', 'appCommon', 'customerService'];
	function customerEditController($rootScope, $scope, $state, $stateParams, appCommon, customerService) {
		// models
		$scope.customerKey = $stateParams.customerKey;
		$scope.formStatus = angular.isUndefined($scope.CustomerKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;

		// function
		function activate() {
			$scope.formTitle = setFormTitle();

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
			if($scope.formStatus === appCommon.formStatus.isNew) return 'Create Customer';
			else if ($scope.formStatus === appCommon.formStatus.isEdit) return 'Edit Customer';
			else return 'Display Customer';			
		};

		// buttons
		$scope.save = function () {
			if (angular.isUndefined($scope.customer)) return;
			
			$scope.disabledButton = true;
			// brandService.updateBrand($scope.brand).then(function (result) {
			// 	$scope.messageSuccess = result.message;
			// 	resetFormStatus();
			// }, function (error) {
			// 	$scope.messageError = error.message;
			// 	resetFormStatus();
			// });
		}

		$scope.cancel = function() {            
            $state.go($state.current.parentState);
        }
		
		/* start */
		activate();
	}
})();