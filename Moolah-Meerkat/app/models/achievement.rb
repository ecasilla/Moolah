class Achievement < ActiveRecord::Base
	validates :name, uniqueness: {scope: :goal_name}
	belongs_to :user
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
end