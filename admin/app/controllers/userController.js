(function () {
	'use strict';
	app.controller('userController', userController);
	userController.$inject = ['$rootScope', '$scope', 'appCommon', 'userService'];
	function userController($rootScope, $scope, appCommon, userService) {
		// models
		$scope.pagination = appCommon.defaultPagination;
		$scope.messageSuccess = [];
		$scope.messageError = [];
		
		// functions
		$scope.getUsers = function(){
			userService.getList($scope.pagination.pageCurrent, $scope.pagination.pageSize)
			.then(function(data){				
				$scope.users = data.PageData;
				$scope.pagination.pageCurrent = data.PageCurrent;
				$scope.pagination.pageSize = data.PageSize;
				$scope.pagination.pageTotal = data.PageTotal;
				$scope.pagination.hitsTotal = data.HitsTotal;
				$scope.pagination.maxSize = Math.ceil(data.HitsTotal/data.PageSize);
			}, function(err){
				console.log(err);
			});
		};

		function activate() {
			$scope.getUsers();
		}
		
		/* start */
		activate();
	}
})();