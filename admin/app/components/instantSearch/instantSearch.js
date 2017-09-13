(function () {
    'use strict';
    angular.module('cargo.components.instantSearch', ['cargo.common'])
    .directive('instantSearch', instantSearch)    
    .controller('instantSearchController', instantSearchController);

	/* 	
	Link References
	https://codepen.io/shahansha/pen/pvWJyv
	https://hello-angularjs.appspot.com/searchtable
	*/

    // directives    
    instantSearch.$inject = ['appCommon'];
    function instantSearch(appCommon){
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            controller: 'instantSearchController',
            templateUrl: function () {				
                return String.format('{0}{1}', appCommon.baseUrl, 'admin/app/components/instantSearch/instantSearch.tpl.html');
            },
            link: function (scope, element, attrs, ngCtrl) {
                console.log('init instantSearch.....');
            }
        };
    };

    // controllers
    instantSearchController.$inject = ['$scope', 'appCommon'];
    function instantSearchController($scope, appCommon){
		// models
		$scope.searchString = '';
		$scope.items = [
			{
				url: '/admin/img/logo.png',
				title: '50 Must-have plugins for extending Twitter Bootstrap',
				image: '/admin/img/logo.png'
			},
			{
				url: '/admin/img/logo.png',
				title: 'Making a Super Simple Registration System With PHP and MySQL',
				image: '/admin/img/logo.png'
			},
			{
				url: '/admin/img/logo.png',
				title: 'Create a slide-out footer with this neat z-index trick',
				image: '/admin/img/logo.png'
			},
			{
				url: '/admin/img/logo.png',
				title: 'How to Make a Digital Clock with jQuery and CSS3',
				image: '/admin/img/logo.png'
			},
			{
				url: '/admin/img/logo.png',
				title: 'Smooth Diagonal Fade Gallery with CSS3 Transitions',
				image: '/admin/img/logo.png'
			},
			{
				url: '/admin/img/logo.png',
				title: 'Mini AJAX File Upload Form',
				image: '/admin/img/logo.png'
			},
			{
				url: '/admin/img/logo.png',
				title: 'Your First Backbone.js App – Service Chooser',
				image: '/admin/img/logo.png'
			}
		];

		// functions
        var activate = function(){
            console.log('--- activate: InstantSearchController ');
		}

		$scope.filter = function(){
			return function(arr, searchString){
			};
		};
		
		// start
        activate();
	}
	

	// create the instant search filter
	app.filter('searchFor', function(){
		// all filters must return a function. The first parameter is the data that is to be filtered, 
		// and the second is an argument that may be passed with a colon (searchFor:searchString)
		return function(arr, searchString){
			if(!searchString){
				return arr;
			}
			var result = [];
			searchString = searchString.toLowerCase();
			// Using the forEach helper method to loop through the array
			angular.forEach(arr, function(item){
				if(item.title.toLowerCase().indexOf(searchString) !== -1){
					result.push(item);
				}
			});
			return result;
		}
	});
})();
