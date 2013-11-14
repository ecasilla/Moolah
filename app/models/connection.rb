class Connection < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => "User"
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
end
