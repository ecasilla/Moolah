class User < ActiveRecord::Base
  
  validates :first_name, :last_name, :email, presence: true
  validates :email, uniqueness: true
  has_and_belongs_to_many :goals
  has_many :achievements
  has_many :transactions
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

#Returns an integer of how many acheievements the user has won
  def penguin
    Achievement.where(user_id: id, name: "Penguin").count 
  end

  def meerkat
  Achievement.where(user_id: id, name: "Meerkat").count    
  end

  def gorilla
    Achievement.where(user_id: id, name: "Gorilla").count
  end

  def yak
    Achievement.where(user_id: id, name: "Yak").count
  end
#Users total savings
  def total_savings
    self.transactions.inject(0) { |total, transaction| total + transaction.amount }
  end

end