class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :password_digest, presence: true
	validates :email, uniqueness: true
	has_and_belongs_to_many :goals
	has_many :achievements
	has_many :connections
	has_many :transactions, through: :goals
end