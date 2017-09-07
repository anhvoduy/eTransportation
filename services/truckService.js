const _ = require('lodash');
const Q = require('q');
const dbContext = require('../lib/dbContext');

// Constructor
const Factory = function () { 
}

Factory.prototype.getList = function(){
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

Factory.prototype.getItem = Q.async(function* (TruckKey){
    let truck;
    try
    {        
        let sql = `
            SELECT TruckId, TruckKey, TruckName, TruckNumber, Description
            FROM Truck
            WHERE TruckKey = @TruckKey AND Deleted = 0
        `;
        yield dbContext.openConnection();
        truck = yield dbContext.queryItem(sql, { TruckKey: TruckKey });
        yield dbContext.closeConnection();
        return truck;
    }catch(err){        
        return err;
    }
});

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
