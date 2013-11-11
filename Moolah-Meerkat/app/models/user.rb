class User < ActiveRecord::Base
	validates :first_name, :last_name, :email, :password_digest, presence: true
	validates :email, uniqueness: true
	has_secure_password
	has_and_belongs_to_many :goals
	has_many :achievements
	has_many :connections
	has_many :tranactions :through => :goals

def self.from_omniauth(auth)
  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.uid = auth.uid
    user.name = auth.info.name
    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
    user.save!
  end
end
  
end