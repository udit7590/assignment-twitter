class Api::V1::TweetSerializer < ActiveModel::Serializer
  class UserSerializer < ActiveModel::Serializer
    attributes :id
  end

  attributes :id, :content
  belongs_to :user
end
