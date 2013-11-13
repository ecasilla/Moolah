class Achievement < ActiveRecord::Base
	belongs_to :user
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
end