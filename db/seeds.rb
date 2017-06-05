# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

titles = ["Eat", "Bathe", "Go food shopping"]

descriptions = ["Something important", "Something more important", "Something less important"]

3.times do
	Task.create(title: titles.sample, description: descriptions.sample)
end