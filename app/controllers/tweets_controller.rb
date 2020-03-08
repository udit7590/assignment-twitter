class TweetsController < ApplicationController
  def create
    @tweet = current_user.tweets.new(tweet_params)
    @tweet.save
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:content)
  end
end
