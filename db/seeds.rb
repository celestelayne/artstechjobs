# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
		User.destroy_all
#		Create some users
	  User.create([
	  	{
				first_name: "Tamara",
				last_name: "Williams",
				email: "tamara@gmail.com",
				password_digest: "meriden"
	  	},
	  	{
				first_name: "Wilma",
				last_name: "Williams",
				email: "wilma@gmail.com",
				password_digest: "clover"
	  	}
		])