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

var peoples = [
    {name: '11', sex: false},
    {name: '12', sex: false},
    {name: '13', sex: false},
    {name: '14', sex: false},
    {name: '15', sex: true},
    {name: '16', sex: false},
    {name: '20', sex: true},
    {name: '22', sex: true}
];

// Export
module.exports = {
	user: user,
	users: users,
	peoples: peoples
};
