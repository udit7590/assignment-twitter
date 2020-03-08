module Api
  module V1
    class TweetsController < Api::ApiController
      before_action :set_default, only: :create

      def create
        run ReviewRequest::Create do |result|
          return successful_post(result['model'].id)
        end

        unprocessable_entity
      end

  end
end
