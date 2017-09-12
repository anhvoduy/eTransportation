(function () {
	'use strict';
	app.controller('productEditController', productEditController);
	productEditController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', 'appCommon', 'brandService', 'productService'];
	function productEditController($rootScope, $scope, $state, $stateParams, appCommon, brandService, productService) {
		// models
		$scope.isSubmitted = false;
		$scope.isSubmitting = false;
		$scope.productKey = $stateParams.productKey;
		$scope.master = {}; // https://docs.angularjs.org/guide/forms
		$scope.formStatus = appCommon.isUndefined($scope.productKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;
		$scope.messageSuccess = [];
		$scope.messageError = [];

		// function
		function activate() {
			$scope.formTitle = setFormTitle();

			// check connection pool
			brandService.getList().then(function(result){
				$scope.brands = result;
			}, function(error){
				$scope.messageError.push(error);
			});

			if(!appCommon.isUndefined($scope.productKey)){
				productService.getItem($scope.productKey).then(function (result) {
					$scope.product = result;
				}, function (error) {
					$scope.messageError.push(error);
				});
			}
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