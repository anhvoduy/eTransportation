(function () {
	'use strict';
	app.controller('brandController', brandController);
	brandController.$inject = ['$rootScope', '$scope', 'brandService'];
	function brandController($rootScope, $scope, brandService) {
		// models

		// functions
		function activate() {
			brandService.getList().then(function(data){
				$scope.brands = data;
			}, function(err){
				console.log(err);
			});
		}
		
		/* start */
		activate();
	}
})();