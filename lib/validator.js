const validator = function () { 
}

validator.prototype.validateRating = function (rating) {
    var _rating = parseInt(rating);
    if (_rating > 0 && _rating < 10) return true;
    else return false;
}

validator.prototype.validateEmail = function (email) {
    var regex = /\S+@\S+\.\S+/;
    if (regex.test(email)) return true;
    else return false;
}

// Export
module.exports = new validator;
