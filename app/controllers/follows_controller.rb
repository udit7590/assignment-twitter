class FollowsController < ApplicationController
  # Follow
  def create
    if current_user.following?(user)
      redirect_to root_path, alert: 'Already following', status: 422
    elsif current_user.follow(user)
      redirect_to root_path, alert: 'Following now', status: 202
    else
      redirect_to root_path, alert: 'Unable to follow', status: 422
    end
  end

  # Unfollow
  def destroy
    if current_user.unfollow(user)
      redirect_to root_path, alert: 'Unfollowing now', status: 200
    else
      redirect_to root_path, alert: 'Unable to unfollow', status: 422
    end
  end

  private
    def user
      @follow_user ||= User.find_by(id: params[:user_id])
    end
end
