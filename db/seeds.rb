# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'pp'
pp user = User.create_with(password: 'password').find_or_create_by(email: 'admin@mail.com', username: 'admin')
posts = [
  { title: 'Google', link: 'https://www.google.com'},
  { title: 'Facebook', link: 'https://www.facebook.com'},
  { title: 'StackOverflow', link: 'https://www.stackoverflow.com'},
  { title: 'Github', link: 'https://www.github.com'},
  { title: 'Reddit', link: 'https://www.reddit.com'}
].each { |post_attributes| pp Post.find_or_create_by(post_attributes.merge(user: user)) }
