(function () {
    'use strict';    
    angular.module('cargo.common', []).factory('appCommon', appCommon);
    appCommon.$inject = ['$rootScope'];
    function appCommon($rootScope) {
        // constructor
        var appCommon = function () {
        }
        
        appCommon.prototype = new appCommon();
        appCommon.prototype.constructor = appCommon;
        
        // functions
        appCommon.prototype.isUndefined = function(value){
            if(value === undefined || value === null){
                return true;
            }else if(value === 'undefined' || value === 'null'){
                return true;
            }else{
                return false;
            }
        }

        appCommon.prototype.baseUrl = function(){            
            return '/'; // dev local mode
        };

        return new appCommon;
    };        
})();