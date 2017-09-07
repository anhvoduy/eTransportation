(function () {
	'use strict';
	app.controller('productController', productController);
	productController.$inject = ['$rootScope', '$scope', 'productService'];
	function productController($rootScope, $scope, productService) {
		// models

		// functions
		function activate() {
			productService.getList().then(function(data){
				$scope.products = data;
			}, function(err){
				console.log(err);
			});
		}
		
		/* start */
		activate();
	}
})();