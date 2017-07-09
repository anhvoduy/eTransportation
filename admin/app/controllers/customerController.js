(function () {
	'use strict';
	app.controller('customerController', customerController);
	customerController.$inject = ['$rootScope', '$scope', 'customerService'];
	function customerController($rootScope, $scope, customerService) {
		
		// functions
		function activate() {			
			customerService.getItems().then(function(data){
				$scope.customers = data;
			}, function(err){
				console.log(err);
			});
		}
		
		/* start */
		activate();
	}
})();