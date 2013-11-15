class Goal < ActiveRecord::Base
  validates :name, :final_amount, :deadline, presence: true
  has_and_belongs_to_many :users
  has_many :transactions


  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  # logic for calculating total transaction amount
  def balance(id)
    self.transactions.where(user_id: id).sum(:amount)
  end

  # logic for an individual's goal within a group goal.
  def individual_final_amount
    self.final_amount / self.users.length
  end

  # this has to do with achievements
  def progress_as_float(user)
    progress = (balance(user.id).to_f / (self.final_amount / self.users.length)) * 100
  end

  def progress
    colors = ["red", "blue", "orange", "pink", "yellow", "brown", "purple", "darkgoldenrod", "green", "beige"]
    count = 0
    progress = {}
    self.users.each do |user|
      individual_progress = (balance(user.id).to_f / self.individual_final_amount) * 100
      progress[user.id] = {:individual_progress => "#{individual_progress}%", :color => colors[count], :individuals_progress_for_goal => "#{individual_progress / self.users.length}%" }
      count +=1
    end
    return progress
  end

  def transform_date
    d = Date.parse(self.deadline.to_s)
    return "#{Date::MONTHNAMES[d.mon]} #{d.mday}, #{d.year}"
  end


end