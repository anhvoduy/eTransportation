const validateRating = function (rating) {
    var _rating = parseInt(rating);
    if (_rating > 0 && _rating < 10) return true;
    else return false;
}

const validateEmail = function (email) {
    var regex = /\S+@\S+\.\S+/;
    if (regex.test(email)) return true;
    else return false;
}

module.exports = {
    validateRating: validateRating,
    validateEmail: validateEmail,
};
