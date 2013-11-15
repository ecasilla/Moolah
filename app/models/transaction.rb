class Transaction < ActiveRecord::Base
  validates :description,:amount, presence: true
  belongs_to :goal
  belongs_to :user

  after_create :create_achievement

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  def create_achievement
  	achievement = Achievement.new(user: user, goal: goal)
  	achievement.save
  end
end