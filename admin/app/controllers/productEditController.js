(function () {
	'use strict';
	app.controller('productEditController', productEditController);
	productEditController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', 'appCommon', 'productService'];
	function productEditController($rootScope, $scope, $state, $stateParams, appCommon, productService) {
		// models
		$scope.isSubmitted = false;
		$scope.isSubmitting = false;
		$scope.productKey = $stateParams.productKey;
		$scope.master = {}; // https://docs.angularjs.org/guide/forms
		$scope.formStatus = appCommon.isUndefined($scope.productKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;
		$scope.messageSuccess = {};
		$scope.messageError = {};

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

		function validateMaster(master){
			if(!master){
				return false;
			}
			else if(angular.isUndefined(master.ProductCode) || formProduct.ProductCode.$invalid){
				return false;
			}
			else if(angular.isUndefined(master.ProductName) || formProduct.ProductName.$invalid){
				return false;
			}
			else{
				return true;
			}			
		}

		// buttons
		$scope.submit = function (product) {
			$scope.isSubmitted = true; // validate UI
			$scope.master = angular.copy(product); // clone new object
			if(!$scope.master || !validateMaster($scope.master)) // validate business rules
			{ 
				$scope.isSubmitted = false;
				return;
			}
			// start submit to server
			$scope.isSubmitting = true;
			productService.update($scope.master).then(function(result){				
				$scope.isSubmitted = false;
				$scope.isSubmitting = false;
			}, function(error){				
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