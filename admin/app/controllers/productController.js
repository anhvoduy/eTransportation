(function () {
	'use strict';
	app.controller('productController', productController);
	productController.$inject = ['$rootScope', '$scope', 'appCommon', 'productService'];
	function productController($rootScope, $scope, appCommon, productService) {
		// models
		$scope.pagination = appCommon.defaultPagination;
		$scope.messageSuccess = [];
		$scope.messageError = [];

		// functions
		function activate() {
			$scope.getProducts();
		}
		
		$scope.getProducts = function() {
			productService.getList($scope.pagination.pageCurrent, $scope.pagination.pageSize)
			.then(function(data){				
				$scope.products = data.PageData;
				$scope.pagination.pageCurrent = data.PageCurrent;
				$scope.pagination.pageSize = data.PageSize;
				$scope.pagination.pageTotal = data.PageTotal;
				$scope.pagination.hitsTotal = data.HitsTotal;
				$scope.pagination.maxSize = Math.ceil(data.HitsTotal/data.PageSize);
			}, function(err){
				console.log(err);
			});
		}		
		
		/* start */
		activate();
	}
})();