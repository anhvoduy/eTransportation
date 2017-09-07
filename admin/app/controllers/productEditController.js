(function () {
	'use strict';
	app.controller('productEditController', productEditController);
	productEditController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', 'appCommon', 'productService'];
	function productEditController($rootScope, $scope, $state, $stateParams, appCommon, productService) {
		// models
		$scope.productKey = $stateParams.productKey;
		$scope.formStatus = angular.isUndefined($scope.truckKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;

		// function
		function activate() {
			$scope.formTitle = setFormTitle();

			productService.getItem($scope.productKey).then(function (result) {
				$scope.product = result;
				if (angular.isUndefined($scope.product)) {
					$scope.messageErrorTruck = String.format("The Product Key: {0} not found.", $scope.productKey);
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
			if($scope.formStatus === appCommon.formStatus.isNew) return 'Create Product';
			else if ($scope.formStatus === appCommon.formStatus.isEdit) return 'Edit Product';
			else return 'Display Product';			
		};

		// buttons
		$scope.save = function () {
			if (angular.isUndefined($scope.product)) return;
			
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