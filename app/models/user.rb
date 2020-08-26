class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :friends
  has_many :tweets
  has_many :likes 
  has_many :liked_tweets, through: :likes, source: :tweet

  def arr_friends_id
    self.friends.pluck(:friend_id)
  end

  def users_followed
    arr_ids = self.friends.pluck(:friend_id)
    User.find(arr_ids)
  end

  def is_following?(user)
    users_followed.include? (user)
  end

end
