(function () {
	'use strict';
	app.controller('brandEditController', brandEditController);
	brandEditController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', 'appCommon', 'brandService'];
	function brandEditController($rootScope, $scope, $state, $stateParams, appCommon, brandService) {
		// models
		$scope.brandKey = $stateParams.brandKey;
		$scope.formStatus = appCommon.isUndefined($scope.brandKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;

		// function
		function activate() {
			$scope.formTitle = setFormTitle();

			brandService.getItem($scope.brandKey).then(function (result) {
				$scope.brand = result;
				if (angular.isUndefined($scope.brand)) {
					$scope.messageErrorBrand = String.format("The Brand Key: {0} not found.", $scope.brandKey);
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
			if($scope.formStatus === appCommon.formStatus.isNew) return 'Create Brand';
			else if ($scope.formStatus === appCommon.formStatus.isEdit) return 'Edit Brand';
			else return 'Display Brand';			
		};

		function validateMaster(master){
			if(!master){
				return false;
			}
			else if(angular.isUndefined(master.BrandName) || formBrand.BrandName.$invalid){
				return false;
			}			
			else{
				return true;
			}			
		}

		// buttons
		$scope.submit = function (brand) {
			$scope.isSubmitted = true; // validate UI
			$scope.master = angular.copy(brand); // clone new object
			if(!$scope.master || !validateMaster($scope.master)) // validate business rules
			{ 
				$scope.isSubmitted = false;
				return;
			}
			else
			{
				// start submit to server
				$scope.isSubmitting = true;
				brandService.update($scope.master).then(function(result){
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
		}

		$scope.cancel = function() {            
            $state.go($state.current.parentState);
        }
		
		/* start */
		activate();
	}
})();