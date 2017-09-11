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

		// buttons
		$scope.save = function () {
			if (angular.isUndefined($scope.brand)) return;
			
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