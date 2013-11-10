class Balance < ActiveRecord::Base
	belongs_to :goal
  has_many :tranactions
end