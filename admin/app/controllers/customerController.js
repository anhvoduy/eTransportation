(function () {
	'use strict';
	app.controller('customerController', customerController);
	customerController.$inject = ['$rootScope', '$scope', 'appCommon', 'customerService'];
	function customerController($rootScope, $scope, appCommon, customerService) {
		// models
		$scope.pagination = appCommon.defaultPagination;
		$scope.messageSuccess = [];
		$scope.messageError = [];
		
		// functions
		$scope.getCustomer = function(){
			customerService.getList($scope.pagination.pageCurrent, $scope.pagination.pageSize)
			.then(function(data){
				$scope.customers = data.PageData;
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
			$scope.getCustomer();
		}
		
		/* start */
		activate();
	}
})();