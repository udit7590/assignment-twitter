module Api
  module V1
    class FollowsController < Api::ApiController
      def create
        if current_user.following?(user)
          error_response 'Already following', 422
        elsif current_user.follow(user)
          successful_response 'Following now', 202
        else
          error_response 'Unable to follow', 422
        end
      end

      # Unfollow
      def destroy
        if current_user.unfollow(user)
          successful_response 'Unfollowing now', 200
        else
          error_response 'Unable to unfollow', 422
        end
      end

      private
        def user
          @follow_user ||= User.find_by(id: params[:user_id])
        end
    end
  end
end
