class Achievement < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { :scope => [:user_id, :goal_id] }
	belongs_to :user
	belongs_to :goal

	before_validation :set_achievement_name

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  private

  def set_achievement_name
  	progress = goal.progress_as_float(user)

    case progress.to_i
    when 1...25
      return 
    when 25...50
      self.name = "Penguin"
    when 50...75
      self.name = "Meerkat"
    when 75...100
      self.name = "Gorilla"
    when 100..1000
      self.name = "Yak"
    end
  end
end