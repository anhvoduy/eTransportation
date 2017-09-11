(function () {
	'use strict';
	app.controller('groupController', groupController);
	groupController.$inject = ['$rootScope', '$scope', 'groupService'];
	function groupController($rootScope, $scope, groupService) {
		
		// functions
		function activate() {			
			groupService.getList().then(function(data){
				$scope.groups = data;
			}, function(err){
				console.log(err);
			});
		}
		
		/* start */
		activate();
	}
})();