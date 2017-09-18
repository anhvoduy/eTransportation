(function () {
	'use strict';
	app.controller('customerController', customerController);
	customerController.$inject = ['$rootScope', '$scope', '$log', 'customerService'];
	function customerController($rootScope, $scope, $log, customerService) {
		// models
		$scope.pagination = {
			hitsTotal: 10,
			pageCurrent: 1,
			pageSize: 10,
			maxSize: 5
		}
		
		$scope.setPage = function (pageNo) {
			$scope.pagination.pageCurrent = pageNo;
		};		
		$scope.pageChanged = function() {
			$log.log('Page changed to: ' + $scope.pagination.pageCurrent);
			getCustomer();
		};
		
		// functions
		function getCustomer(){
			customerService.getList($scope.pagination.pageCurrent, $scope.pagination.pageSize)
			.then(function(data){
				$scope.customers = data.PageData;
				$scope.pagination.hitsTotal = data.HitsTotal;
			}, function(err){
				console.log(err);
			});
		}

		function activate() {
			getCustomer();			
		}
		
		/* start */
		activate();
	}
})();