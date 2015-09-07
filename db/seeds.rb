# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Post.create([
     { title: 'First post', content: 'Test 1' },
     { title: 'Second post', content: 'Test 2' },
     { title: 'Third post', content: 'Test 3' },
     { title: 'Fourth post', content: 'Test 4' },
 ])