class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :follows, as: :follower, dependent: :destroy
  has_many :followers, as: :followable, dependent: :destroy, class_name: 'Follow'

  scope :tweets_from, -> (user) { tweets.where(user: user) }

  def follow(user)
    return if following?(user)

    follows.create!(followable: user)
  end

  def unfollow(user)
    return unless following?(user)

    follows.where(followable: user).destroy_all
  end

  def following?(user)
    follows.where(followable: user).present?
  end

  def tweets_from_follows
    Tweet.where(user_id: follows.pluck(:followable_id))
  end
end
