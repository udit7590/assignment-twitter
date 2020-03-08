class Api::V1::TweetSerializer < ActiveModel::Serializer
  attributes :id, :content
  belongs_to :user
end
