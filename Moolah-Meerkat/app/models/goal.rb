class Goal < ActiveRecord::Base
	validates :name, :final_amount, presence: true
	has_and_belongs_to_many :users
	has_many :balances
  has_many :transactions :through => :balances
end