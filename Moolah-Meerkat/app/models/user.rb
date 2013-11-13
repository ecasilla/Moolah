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
  
  def checkAchievement(goal_id)
    if user.achievements.length > 1
    end
  end

  def setAchievement(goal_id)
    achievementCalc(goal_id)
    case @progress
     when @progress <= 25
       return 
     when @progress >25
      return "achievement 25%"

     end  
      #>25% <50% achievement 1 LIMIT TO 1
      #>50% <75% achievement 2 LIMIT TO 1
      #<100% >75% achievement 3 LIMIT TO 1
      # if == 100% achievement 4 LIMIT TO 1
      
    end
  end

  def achievementCalc(goal_id)
    @goal = goal_id
    @famount = @goal.final_amount
    @transaction = @goal.transactions
    @getamount = @transaction
    @amount = @transaction[0].amount
    @amount = @amount.to_f
    @famount = @famount.to_f
    @completetion = @amount/@famount *100
    return @completetion.to_i
  end

  def total_savings
    self.transactions.inject(0) { |total, transaction| total + transaction.amount }
  end

  def progress(goal_id)
    @goal = goal_id
    @famount = @goal.final_amount
    total_savings - @famount = @new_balance
  end


end