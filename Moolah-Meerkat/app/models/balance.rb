class Balance < ActiveRecord::Base
	belongs_to :goal
  has_many :transactions
end