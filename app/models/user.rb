class User < ApplicationRecord
  def self.find_or_create_user(auth)
    user = User.find_or_create_by(uid: auth[:uid])

    user.nickname = auth['info']['nickname']
    user.provider = auth['provider']
    user.uid      = auth['uid']
    user.name     = auth['info']['name']
    user.token    = auth['credentials']['token']
    user.save

    return user
  end
end
