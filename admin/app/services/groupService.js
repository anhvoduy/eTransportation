(function () {
    'use strict';
    app.factory('groupService', groupService);
    groupService.$inject = ['$q', 'baseService'];
    function groupService($q, baseService) {
        // constructor
        var groupService = function () {            
        }
        groupService.prototype = new baseService('api/group');
        groupService.prototype.constructor = groupService;
                
        // methods
        groupService.prototype.getList = function () {
            var url = String.format('{0}{1}', this.api, '/list');
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        groupService.prototype.getItem = function (groupKey) {
            var url = String.format('{0}{1}{2}{3}', this.api, '/item', '?GroupKey=', groupKey);
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        groupService.prototype.getPermission = function (groupKey) {
            var url = String.format('{0}{1}{2}{3}', this.api, '/permission', '?GroupKey=', groupKey);
            
            var q = $q.defer();
            this.getData(url).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }
                
        groupService.prototype.update = function (customer) {
            var url = String.format('{0}{1}', this.api, '/update');
            
            var q = $q.defer();
            this.postData(url, customer).then(function (result) {
                q.resolve(result);
            }, function (error) {
                q.reject(error);
            })
            return q.promise;
        }

        // export
        return new groupService;
    };
})();