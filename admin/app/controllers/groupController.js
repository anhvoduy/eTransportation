(function () {
	'use strict';
	app.controller('groupController', groupController);
	groupController.$inject = ['$rootScope', '$scope', 'userService', 'groupService'];
	function groupController($rootScope, $scope, userService, groupService) {
		
		// functions
		function activate() {			
			userService.getList().then(function(data){
				$scope.users = data;
			}, function(err){
				console.log(err);
			});
		}
		
		/* start */
		activate();
	}
})();