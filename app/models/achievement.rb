class Achievement < ActiveRecord::Base
	validates :name, presence: true, uniqueness: { :scope => [:user_id, :goal_id] }
	belongs_to :user
	belongs_to :goal

	before_validation :set_achievement_name

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  # TODO use meta programming to avoid duplication
  def self.penguin
    where(name: "Penguin")
  end
  
  def self.meekat
    where(name: "Meerkat")
  end
  
  def self.gorilla
    where(name: "Gorilla")
  end
    
  def self.yak
    where(name: "Yak")
  end

  private

  # TODO use another data structure to store name and range, something like hash + array
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