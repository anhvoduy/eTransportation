// define sample objects by Json
var user = {
	userName: 'admin',
	password: '@dmin',
	firstName: 'Admin',
	lastName: 'Transport',
	displayName: 'Admin Transport'
}

var users = [
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

// Export
module.exports = {
	user: user,
	users: users
};
