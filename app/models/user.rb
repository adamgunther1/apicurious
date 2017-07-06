class User < ApplicationRecord
  def self.find_or_create_from_auth(auth)
    user = User.find_or_create_by(provider: auth['provider'], uid: auth['uid'])

    user.username = auth['info']['nickname']
    user.image_url = auth['info']['image']
    user.token = auth['credentials']['token']
    user.num_of_repos = auth['extra']['raw_info']['public_repos']
    user.num_of_followers = auth['extra']['raw_info']['followers']
    user.num_following = auth['extra']['raw_info']['following']

    user.save
    user
  end
end
