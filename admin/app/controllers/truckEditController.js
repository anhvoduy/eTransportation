(function () {
	'use strict';
	app.controller('truckEditController', truckEditController);
	truckEditController.$inject = ['$rootScope', '$scope', '$state', '$stateParams', '$timeout', 'appCommon', 'truckService'];
	function truckEditController($rootScope, $scope, $state, $stateParams, $timeout, appCommon, truckService) {
		// models
		$scope.isSubmitted = false;
		$scope.isSubmitting = false;
		$scope.truckKey = $stateParams.truckKey;
		$scope.master = {}; // https://docs.angularjs.org/guide/forms
		$scope.formStatus = appCommon.isUndefined($scope.truckKey) ? appCommon.formStatus.isNew : appCommon.formStatus.isEdit;
		$scope.messageSuccess = {};
		$scope.messageError = {};

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

		function validateMaster(master){
			if(!master){
				return false;
			}
			else if(angular.isUndefined(master.TruckName) || formTruck.TruckName.$invalid){
				return false;
			}
			else if(angular.isUndefined(master.TruckNumber) || formTruck.TruckNumber.$invalid){
				return false;
			}
			else{
				return true;
			}			
		}

		// buttons
		$scope.submit = function (truck) {
			$scope.isSubmitted = true; // validate UI
			$scope.master = angular.copy(truck); // clone new object
			if(!$scope.master || !validateMaster($scope.master)) // validate business rules
			{ 
				$scope.isSubmitted = false;
				return;
			}
			else
			{
				// start submit to server
				$scope.isSubmitting = true;
				truckService.update($scope.master).then(function(result){
					//console.log(result);
					$scope.isSubmitted = false;
					$scope.isSubmitting = false;
				}, function(error){
					//console.log(error);
					$scope.isSubmitted = false;
					$scope.isSubmitting = false;
				});
				// $timeout(function(){
				// 	console.log('submitForm()......');
				// 	truckService.
				// 	$scope.isSubmitted = false;
				// 	$scope.isSubmitting = false;
				// }, 3000);
			}

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