class DashboardController < ApplicationController
  def index
    @tweets = current_user.tweets_from_follows
    @users = User.all.where.not(id: current_user.id)
  end
end
