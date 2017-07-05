const _ = require('lodash');
const Q = require('q');
const data = require('../database/sampleData');

// Constructor
const Factory = function(){	
}

Factory.prototype.getBrands = function(){
    return [
        {
            id: 1,
            title: 'brand 1'
        },
        {
            id: 2,
            title: 'brand 2'
        }
    ]
}

Factory.prototype.getBrandById = function(brandId){
    return {
        id: 2,
        title: 'brand 2'
    }
}

// Export
module.exports = new Factory;
