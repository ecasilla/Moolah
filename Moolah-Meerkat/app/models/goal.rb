class Goal < ActiveRecord::Base
	validates :name, :final_amount, presence: true
	has_and_belongs_to_many :users
	has_many :transactions

  def balance(id)
    balance = 0

    self.transactions.each do |transaction|
      if transaction.user_id == id
        balance += transaction.amount
      end
    end
    
    balance
  end

  def transform_date
    d = Date.parse(self.deadline.to_s)
    return "#{Date::MONTHNAMES[d.mon]} #{d.mday}, #{d.year}"
  end

end