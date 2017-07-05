// define sample objects by Json
var myProfile = function(){
	return {
		userName: 'beckham',
		password: '@dmin',
		firstName: 'David',
		lastName: 'Beckham',
		displayName: 'David Beckham'
	}
}

var getUser = function(){
	return {
		userName: 'admin',
		password: '@dmin',
		firstName: 'Admin',
		lastName: 'Transport',
		displayName: 'Admin Transport'
	}
}

var getUsers = function(){
	return [
		{
			userName: 'beckham',
			password: '@dmin',
			firstName: 'David',
			lastName: 'Beckham',
			displayName: 'David Beckham'
		},
		{
			userName: 'cantona',
			password: '@dmin',
			firstName: 'Eric',
			lastName: 'Cantona',
			displayName: 'Eric Cantona'
		},
		{
			userName: 'ronaldo',
			password: '@dmin',
			firstName: 'CR',
			lastName: 'Ronaldo',
			displayName: 'CR Ronaldo'
		}
	];
}

var getPeoples = function(){
	return [
		{name: '11', sex: false},
		{name: '12', sex: false},
		{name: '13', sex: false},
		{name: '14', sex: false},
		{name: '15', sex: true},
		{name: '16', sex: false},
		{name: '20', sex: true},
		{name: '22', sex: true}
	];
}

var getMenus = function(){
	var menus = [

	];
	return menus;
};

// Export
module.exports = {
	myProfile: myProfile,
	getUser: getUser,
	getUsers: getUsers,
	getPeoples: getPeoples,
	getMenus: getMenus
};
