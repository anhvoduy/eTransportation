(function () {
    'use strict';
    angular.module('cargo.components.search', ['cargo.common'])
    .directive('userSearch', userSearch)    
	.controller('userSearchController', userSearchController)
	.filter('searchFor', searchFor);

	/* 	
	Link References
	https://codepen.io/shahansha/pen/pvWJyv
	https://hello-angularjs.appspot.com/searchtable
	*/

    // directives    
    userSearch.$inject = ['appCommon'];
    function userSearch(appCommon){
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            controller: 'userSearchController',
            templateUrl: function () {
                return String.format('{0}{1}', appCommon.baseUrl, 'admin/app/components/search/userSearch.tpl.html');
            },
            link: function (scope, element, attrs, ngCtrl) {
                console.log('init directive user-search.....');
            }
        };
    };

    // controllers
    userSearchController.$inject = ['$scope', 'appCommon', 'userService'];
    function userSearchController($scope, appCommon, userService){
		// models
		$scope.searchString = '';
		$scope.items = [];
		// $scope.items = [
		// 	{
		// 		url: '/admin/img/logo.png',
		// 		title: '50 Must-have plugins for extending Twitter Bootstrap',
		// 		image: '/admin/img/logo.png'
		// 	}
		// ];

		// functions
        var activate = function(){
			console.log('--- activate: userSearchController ');

			userService.getList().then(function(data){
				$scope.items = data;
				angular.forEach($scope.items, function(item){
					item.url = '/admin/img/logo.png';
					item.image = '/admin/img/logo.png';
				});				
			}, function(err){
				console.log(err);
			});
		}		
		
		// start
        activate();
	}

	
	// instance search filter
	function searchFor(){
		// all filters must return a function. The first parameter is the data that is to be filtered, 
		// and the second is an argument that may be passed with a colon (searchFor:searchString)
		return function(arr, searchString){
			if(!searchString) return arr;

			var result = [];
			searchString = searchString.toLowerCase();
			// Using the forEach helper method to loop through the array
			angular.forEach(arr, function(item){
				if(item.DisplayName.toLowerCase().indexOf(searchString) !== -1){
					result.push(item);
				}
			});
			return result;
		}
	};
})();
