# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
party = Party.create([{current_xp: 2000, current_level: 3}])

players = 10.times do
  Player.create([{name: "bob", level: 3, armor_class: 15, passive_perception: 12}])
end
