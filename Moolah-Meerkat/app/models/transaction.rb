class Transaction < ActiveRecord::Base
  validates :description,:amount, presence: true
  belongs_to :goal

<<<<<<< HEAD

=======
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
>>>>>>> master
end