class Transaction < ActiveRecord::Base
  validates :description,:amount, presence: true
  belongs_to :goal
end