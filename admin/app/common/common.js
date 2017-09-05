(function () {
    'use strict';    
    angular.module('cargo.common', []).factory('appCommon', appCommon);
    appCommon.$inject = ['$rootScope', '$cookieStore'];
    function appCommon($rootScope, $cookieStore) {
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

        // constanst
        appCommon.prototype.formStatus = {
            isNew: 1,
            isEdit: 2,
            isView: 3
        };

        appCommon.prototype.baseUrl = function(){            
            return '/'; // dev local mode
        };

        return new appCommon;
    };        
})();