module Api
  module V1
    class TweetsController < Api::ApiController
      def me
        @tweets = current_user.tweets_from_follows
        render json: @tweets
      end
    end
  end
end
