# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#House.create(name: "65 Chetwynd Rd")
#House.create(name: "20 Fletcher Pl")
User.create(username: "michael", balance: "0", email: "msilverblatt@gmail.com", house_id: "1")
User.create(username: "jackson", balance: "0", email: "jackson.maslow@gmail.com", house_id: "2")