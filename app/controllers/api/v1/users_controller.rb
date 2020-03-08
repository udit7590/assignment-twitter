module Api
  module V1
    class UsersController < Api::ApiController
      def me
        render json: current_user
      end

      def show
        user = User.find_by(id: params[:id])
        render json: user
      end
    end
  end
end
