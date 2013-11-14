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
  
  def checkAchievement(goal)
    if user.achievements.length > 1
    end
  end

  def setAchievement(goal)
    user_progress = progress(goal)
    case user_progress
     when user_progress <= 25
       return "You have not reach an achievement"
     when user_progress > 25
      return "achievement 25%"
      #>25% <50% achievement 1 LIMIT TO 1
      #>50% <75% achievement 2 LIMIT TO 1
      #<100% >75% achievement 3 LIMIT TO 1
      # if == 100% achievement 4 LIMIT TO 1      
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
    elsif @balance == 0
      return  
    else
    @completetion = @new_balance *100
   end
   return @completetion.abs
  end

  def total_savings
    self.transactions.inject(0) { |total, transaction| total + transaction.amount }
  end

    # def achievementCalc(goal_id)
  #   @goal = goal_id
  #   @famount = @goal.final_amount
  #   @transaction = @goal.transactions
  #   @getamount = @transaction
  #   @amount = total_savings.to_i
  #   @famount = @famount.to_f
  #   @completetion = @amount/@famount *100
  #   @completetion = @completetion.to_i
  #   progress(@completetion,goal_id)
  # end


end