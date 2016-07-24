# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Party.create([{current_xp: 14000, current_level: 6}])

Player.create({name: "Aku", level: 7, armor_class: 19, passive_perception: 12, current_experience: 22000})
Player.create({name: "Xytrana", level: 6, armor_class: 14, passive_perception: 12, current_experience: 14000})
Player.create({name: "Mikaela", level: 6, armor_class: 13, passive_perception: 12, current_experience: 14000})
Player.create({name: "Kai", level: 6, armor_class: 15, passive_perception: 12, current_experience: 14000})
