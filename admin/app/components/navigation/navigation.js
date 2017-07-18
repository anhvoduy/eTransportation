(function () {
    'use strict';
    angular.module('cargo.components.navigation', ['cargo.common'])
    .directive('navigationMenu', navigationMenu)
    .directive('topMenu', topMenu)
    .directive('sidebarMenu', sidebarMenu)    
    .controller('navigationController', navigationController);

    // directives    
    navigationMenu.$inject = ['appCommon'];
    function navigationMenu(appCommon){
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            controller: 'navigationController',
            templateUrl: function () {
                return String.format('{0}{1}', appCommon.baseUrl, "admin/app/components/navigation/navigaton.tpl.html");
            },
            link: function (scope, element, attrs, ngCtrl) {
                console.log('init navigation.....');
            }
        };
    };    

    topMenu.$inject = ['appCommon'];
    function topMenu(appCommon){
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            controller: 'navigationController',
            templateUrl: function () {
                return String.format('{0}{1}', appCommon.baseUrl, "admin/app/components/navigation/topMenu.tpl.html");
            },
            link: function (scope, element, attrs, ngCtrl) {
                console.log('init topMenu.....');
            }
        };
    };

    sidebarMenu.$inject = ['appCommon'];
    function sidebarMenu(appCommon){
        return {
            restrict: 'EA',
            replace: true,
            transclude: true,
            controller: 'navigationController',
            templateUrl: function () {
                return String.format('{0}{1}', appCommon.baseUrl, "admin/app/components/navigation/sidebarMenu.tpl.html");
            },
            link: function (scope, element, attrs, ngCtrl) {
                console.log('init sidebarMenu.....');
            }
        };
    };


    // controllers
    navigationController.$inject = ['$scope', 'appCommon'];
    function navigationController($scope, appCommon){        
        var activate = function(){
            console.log('--- activate ---');
        }

        activate();
    }
})();