module Api
  module V1
    class TweetsController < Api::ApiController
      def me
        @tweets = current_user.tweets_from_follows
        @tweets = @tweets.order(created_at: ((params[:sort] == 'asc') ? :asc : :desc))
        render json: @tweets
      end
    end
  end
end
