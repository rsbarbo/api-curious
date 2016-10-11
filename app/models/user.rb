class User < ApplicationRecord
  def self.find_or_create_user(auth)
    User.find_or_create_by(
    provider: auth['provider'],
    uid: auth['uid'],
    name: auth['info']['name']
    )
  end
end
