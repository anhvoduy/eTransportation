(function () {
	'use strict';
	app.controller('dialogController', dialogController);
	dialogController.$inject = ['$rootScope', '$scope', 'close'];
	function dialogController($rootScope, $scope, close){
		// models

		// functions
		var activate = function(){
            console.log('...active dialogController...');
		}

		$scope.close = function (result) {
            close(result, 500); // close, but give 500ms for bootstrap to animate
        };
		
		// start
		activate();
	}
})();