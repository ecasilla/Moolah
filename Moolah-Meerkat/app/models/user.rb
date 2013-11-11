class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, presence: true
	validates :email, uniqueness: true
	has_and_belongs_to_many :goals
	has_many :achievements
	has_many :connections

	has_many :transactions, through: :goals


  has_many :friends, :through => :connections
  has_many :inverse_connections, :class_name => "Connection", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_connections, :source => :user
	has_many :transactions, :through => :goals

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
  end
