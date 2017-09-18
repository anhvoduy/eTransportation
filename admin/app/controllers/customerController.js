(function () {
	'use strict';
	app.controller('customerController', customerController);
	customerController.$inject = ['$rootScope', '$scope', '$log', 'customerService'];
	function customerController($rootScope, $scope, $log, customerService) {
		// models
		$scope.totalItems = 125;
		$scope.currentPage = 1;
		
		$scope.setPage = function (pageNo) {
			$scope.currentPage = pageNo;
		};		
		$scope.pageChanged = function() {
			$log.log('Page changed to: ' + $scope.currentPage);
		};
		
		// functions
		function activate() {			
			customerService.getList().then(function(data){
				$scope.customers = data;
			}, function(err){
				console.log(err);
			});
		}
		
		/* start */
		activate();
	}
})();