(function () {
	'use strict';
	app.controller('truckController', truckController);
	truckController.$inject = ['$rootScope', '$scope', 'appCommon', 'truckService'];
	function truckController($rootScope, $scope, appCommon, truckService) {
		// models
		$scope.pagination = appCommon.defaultPagination;
		$scope.messageSuccess = [];
		$scope.messageError = [];
		
		// functions
		$scope.getTrucks = function() {			
			truckService.getList($scope.pagination.pageCurrent, $scope.pagination.pageSize).then(function(data){				
				$scope.trucks = data.PageData;
				$scope.pagination.pageCurrent = data.PageCurrent;
				$scope.pagination.pageSize = data.PageSize;
				$scope.pagination.pageTotal = data.PageTotal;
				$scope.pagination.hitsTotal = data.HitsTotal;
				$scope.pagination.maxSize = Math.ceil(data.HitsTotal/data.PageSize);
			}, function(err){
				console.log(err);
			});
		}

		function activate() {
			$scope.getTrucks();
		}
		
		/* start */
		activate();
	}
})();