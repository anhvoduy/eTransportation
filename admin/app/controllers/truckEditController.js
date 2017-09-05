(function () {
	'use strict';
	app.controller('truckEditController', truckEditController);
	truckEditController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', 'appCommon', 'truckService'];
	function truckEditController($rootScope, $scope, $state, $stateParams, appCommon, truckService) {
		// models
		$scope.truckKey = $stateParams.truckKey;
		$scope.formStatus = angular.isUndefined($scope.truckKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;

		// function
		function activate() {
			$scope.formTitle = setFormTitle();

			truckService.getItem($scope.truckKey).then(function (result) {
				$scope.truck = result;
				if (angular.isUndefined($scope.truck)) {
					$scope.messageErrorTruck = String.format("The Truck Key: {0} not found.", $scope.truckKey);
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
			if($scope.formStatus === appCommon.formStatus.isNew) return 'Create Truck';
			else if ($scope.formStatus === appCommon.formStatus.isEdit) return 'Edit Truck';
			else return 'Display Truck';			
		};

		// buttons
		$scope.save = function () {
			if (angular.isUndefined($scope.truck)) return;
			
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