(function () {
    'use strict';
    app.factory('userService', userService);
    userService.$inject = ['$q', 'baseService'];
    function userService($q, baseService) {
        // constructor
        var userService = function () {            
        }
        userService.prototype = new baseService('api/user');
        userService.prototype.constructor = userService;
                
        // methods
        userService.prototype.getList = function () {
            var url = String.format('{0}{1}', this.api, '/list');
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        userService.prototype.getItem = function (userKey) {
            var url = String.format('{0}{1}{2}{3}', this.api, '/item', '?UserKey=', userKey);
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }
                
        userService.prototype.update = function (user) {
            var url = String.format('{0}{1}', this.api, '/update');
            
            var q = $q.defer();
            this.postData(url, user).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        // export
        return new userService;
    };
})();