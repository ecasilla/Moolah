class Transaction < ActiveRecord::Base
  validates :description,:amount, presence: true
  belongs_to :goal

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
end