const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');
const data = require('../database/sampleData');

// Constructor
const Factory = function () { 
}

Factory.prototype.getTrucks = function(){
    let deferred  = Q.defer();
    let trucks;

    Q.when()
    .then(function(){
        return dbContext.openConnection();
    })
    .then(function(){
        let sql = `
            SELECT TruckId, TruckKey, TruckName, TruckNumber, Description
            FROM Truck
            WHERE Deleted = 0
            ORDER BY TruckId DESC
        `;
        return dbContext.queryList(sql)
		.then(function(data){
			trucks = data;
        })
        .then(function(){
            dbContext.closeConnection();
        });
    })    
    .then(function(){
        deferred.resolve(trucks);
    })
    .catch(function(err){
        deferred.reject(err);
    });

    return deferred.promise;
}

Factory.prototype.getTruckById = function(truckId){
    return data.getUser();
}

Factory.prototype.createTruck = function(Truck){
    return data.getUsers();
}

Factory.prototype.updateTruck = function(Truck){
    return data.getUsers();
}

Factory.prototype.deleteTruck = function(truckKey){
    return data.getMenus();
}

// Export
module.exports = new Factory;
