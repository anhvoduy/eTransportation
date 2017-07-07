var app = angular.module('cargo', [
	'ngCookies',
	'ui.router',
	'cargo.common',
	'cargo.directives',
	'cargo.components.navigation'
]);

app.config(function ($stateProvider) {
	$stateProvider
	.state('/', {
		url: '',
		views: {
			'view': {
				templateUrl: 'app/views/dashboard.tpl.html',
				controller: 'dashboardController'
			}
		}
	})	
	.state('dashboard', {
		url: '/dashboard',
		views: {
			'view': {
				templateUrl: 'app/views/dashboard.tpl.html',
				controller: 'dashboardController'
			}
		}
	})	
	.state('chart', {
		url: '/chart',
		views: {
			'view': {
				templateUrl: 'app/views/chart.tpl.html',
				controller: 'chartController'
			}
		}
	})
	.state('table', {
		url: '/table',
		views: {
			'view': {
				templateUrl: 'app/views/table.tpl.html',
				controller: 'tableController'
			}
		}
	})
	.state('form', {
		url: '/form',
		views: {
			'view': {
				templateUrl: 'app/views/form.tpl.html',
				controller: 'formController'
			}
		}
	})
	.state('otherwise', {
		url: '/error',
		views: {
			'view': {
				templateUrl: '/app/views/error.tpl.html'
			}
		}
	});
});