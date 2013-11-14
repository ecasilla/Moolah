  class User < ActiveRecord::Base
  
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_and_belongs_to_many :goals
  has_many :achievements
  has_many :transactions, through: :goals
  has_many :connections
  has_many :friends, :through => :connections

  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.email = auth.info.email
      user.photo_url = auth.info.image
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end

  def createAchievement(goal,name)
    @user_id = self.id
    @name = name
    @achievement = goal.name
    @date = Date.current
    achievement = Achievement.new(user_id: @user_id,goal_name: @achievement,name: @name,date: @date) 
    achievement.save
    unless @achievement.nil?
      achievement.save
    end
   achievements
  end

  def setAchievement(goal)
    user_progress = progress(goal)
    case user_progress.to_i
    when 1...25
      return "You have not reached an achievement."
    when 25...50
        badge25 = "penguin"
      createAchievement(goal,badge25)
    when 50...75
        badge50 = "meerkat"
      createAchievement(goal,badge50)
    when 75...100
      badge75 = "gorilla"
      createAchievement(goal,badge75)
    when 100..1000
      badge100 = "yak"
      createAchievement(goal,badge100)    
    end
  end


  def progress(goal)
    @famount = goal.final_amount
    @famount = @famount.to_f 
    @balance = goal.balance(id) 
    @balance = @balance.to_f
    @new_balance = @balance / @famount if @balance <= @famount
    if @balance > @famount
      return 
    elsif @new_balance == 0
      return  
    else
    @completetion = @new_balance *100
  end
  return @completetion.abs
  end

  def groupProgress
    
  end

  def groupAchievements
    
  end

  def total_savings
    self.transactions.inject(0) { |total, transaction| total + transaction.amount }
  end

end