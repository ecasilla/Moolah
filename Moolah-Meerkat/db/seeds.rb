# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
Goal.delete_all

user = User.create(first_name: "Arun", last_name: "Umap", email: "arunumap@gmail.com", password_digest: "helllo", photo_url: "http://www.google.com", total_savings: 4)
user2 = User.create(first_name: "Arun", last_name: "Umap", email: "arunumap@gmail.com", password_digest: "helllo", photo_url: "http://www.google.com", total_savings: 4)
goal = Goal.create(name: "going to europe", description: "save 20", final_amount: 20, deadline: "10/20/1986")
user.goals << goal

