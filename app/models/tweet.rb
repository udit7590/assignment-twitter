class Tweet < ApplicationRecord
  belongs_to :user

  scope :from_user, -> (user) { where(user: user) }
end
