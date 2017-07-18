(function () {
	'use strict';
	app.controller('truckController', truckController);
	truckController.$inject = ['$rootScope', '$scope', 'truckService'];
	function truckController($rootScope, $scope, truckService) {
		
		// functions
		function activate() {			
			truckService.getItems().then(function(data){
				$scope.trucks = data;
			}, function(err){
				console.log(err);
			});
		}
		
		/* start */
		activate();
	}
})();