class Api::V1::UserSerializer < ActiveModel::Serializer
  class FollowSerializer < ActiveModel::Serializer
    attributes :email, :user_id

    def email
      object.followable.try(:email)
    end

    def user_id
      object.followable.try(:id)
    end
  end

  attributes :id, :email, :follows, :followers

  has_many :follows, serializer: Api::V1::UserSerializer::FollowSerializer
  has_many :followers, serializer: Api::V1::UserSerializer::FollowSerializer
  
end
