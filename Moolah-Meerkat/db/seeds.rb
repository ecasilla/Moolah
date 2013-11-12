User.delete_all
Goal.delete_all

user = User.create(first_name: "Arun", last_name: "Umap", email: "arunumap@gmail.com", password_digest: "helllo", photo_url: "http://www.google.com", total_savings: 4)
# User.create!(first_name: "Ernie", last_name: "Casilla", email: "ernie@gmail.com", password_digest: "haha", photo_url: "http://www.yahoo.com", total_savings: 5)
# User.create!(first_name: "Brad", last_name: "Puder", email: "brad@gmail.com", password_digest: "what", photo_url: "http://www.cnn.com", total_savings: 6)
# User.create!(first_name: "Paris", last_name: "Hyun", email: "paris@gmail.com", password_digest: "yes", photo_url: "http://www.buzzfeed.com", total_savings: 7)

goal = Goal.create(name: "going to europe", description: "save 20", final_amount: 20, deadline: "10/20/1986")
user.goals << goal

