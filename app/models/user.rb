require 'securerandom'

class User < ApplicationRecord
  has_many :events
  has_many :comments
  has_secure_password

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
      user.email = auth.info.email
      user.uid = auth.uid
      user.provider = auth.provider
      user.password = SecureRandom.hex
      user.image = auth.info.image
      user.name = auth.info.name
      user.facebook_oauth_token = auth.credentials.token
      user.save!
    end
  end
end
