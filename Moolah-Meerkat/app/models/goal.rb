class Goal < ActiveRecord::Base
	validates :name, :final_amount, presence: true
	has_and_belongs_to_many :users
	has_many :transactions

  def balance(user_id)
    balance = 0

    self.transactions.each do |transaction|
      if transaction.user.id == user_id
        balance += transaction.amount
      end
    end

    balance
  end

  def checkAchievement(user_id)
    user = User.find_by(user_id)
    if user.achievements.length > 1

    end
  end

  def setAchievement(user_id, goal_id)
    @user = User.find(user_id)
    @goal = @user.goals
    @goalSelect = @goal[-1]
    @famount = @goalSelect.final_amount
    @goalfortran = Goal.find(goal_id)
    @transaction = @goalfortran.transactions
    @getamount = @transaction[0]
    @amount = @getamount.amount

    @completetion = ((@amount/@famount)*100)
    return @completetion


  end
  
end