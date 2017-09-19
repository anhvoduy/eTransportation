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
            }
            else if(value === 'undefined' || value === 'null' || value === ''){
                return true;
            }
            else{
                return false;
            }
        }

        // CONSTANST
        appCommon.prototype.baseUrl = '/'; // dev local mode

        appCommon.prototype.formStatus = {
            isNew: 1,
            isEdit: 2,
            isView: 3
        };

        appCommon.prototype.defaultPagination = {
            hitsTotal: 100,
            pageTotal: 10,
			pageCurrent: 1,
			pageSize: 10,
			maxSize: 5,
			lstPageSize: [10, 50, 100]
        };
        
        return new appCommon;
    };
})();