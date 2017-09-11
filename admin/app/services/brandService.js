(function () {
    'use strict';
    app.factory('brandService', brandService);
    brandService.$inject = ['$q', 'baseService'];
    function brandService($q, baseService) {
        // constructor
        var brandService = function () {            
        }
        brandService.prototype = new baseService('api/brand');
        brandService.prototype.constructor = brandService;
                
        // methods
        brandService.prototype.getList = function () {
            var url = String.format('{0}{1}', this.api, '/list');
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }
        
        brandService.prototype.getItem = function (BrandKey) {
            var url = String.format('{0}{1}{2}{3}', this.api, '/item', '?BrandKey=', BrandKey);
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        brandService.prototype.update = function (brand) {
            var url = String.format('{0}{1}', this.api, '/update');
            
            var q = $q.defer();
            this.postData(url, brand).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        // export
        return new brandService;
    };
})();