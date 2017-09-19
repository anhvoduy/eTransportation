(function () {
    'use strict';
    app.factory('productService', productService);
    productService.$inject = ['$q', 'baseService'];
    function productService($q, baseService) {
        // constructor
        var productService = function () {            
        }
        productService.prototype = new baseService('api/product');
        productService.prototype.constructor = productService;
                
        // methods
        productService.prototype.getList = function (pageCurrent, pageSize) {
            var url = String.format('{0}{1}', this.api, '/list');
            var params = {
                PageCurrent: pageCurrent,
                PageSize: pageSize
            }
            
            var q = $q.defer();
            this.getData(url, params).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        productService.prototype.getItem = function (ProductKey) {
            var url = String.format('{0}{1}{2}{3}', this.api, '/item', '?ProductKey=', ProductKey);
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        productService.prototype.update = function (product) {
            var url = String.format('{0}{1}', this.api, '/update');
            
            var q = $q.defer();
            this.postData(url, product).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            });
            return q.promise;
        }

        // export
        return new productService;
    };
})();