(function () {
	'use strict';
	app.controller('customerController', customerController);
	customerController.$inject = ['$rootScope', '$scope', '$log', 'customerService'];
	function customerController($rootScope, $scope, $log, customerService) {
		// models
		$scope.pageTotal = 100;
		$scope.pageCurrent = 1;
		$scope.pageSize = 10;
		
		$scope.setPage = function (pageNo) {
			$scope.pageCurrent = pageNo;
		};		
		$scope.pageChanged = function() {
			$log.log('Page changed to: ' + $scope.pageCurrent);
			getCustomer();
		};
		
		// functions
		function getCustomer(){
			customerService.getList($scope.pageCurrent, $scope.pageSize).then(function(data){
				$scope.customers = data;				
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