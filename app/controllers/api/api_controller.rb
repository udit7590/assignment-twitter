module Api
  #:nodoc:
  class ApiController < ApplicationController
    include Api::Response

    respond_to :json

    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!

    before_action :authenticate_client!

    def authenticate_user!
      return if current_user.present?

      error_response(:unauthorized, 'Incorrect access token', 'invalid_grant')
    end

    def current_user
      return @current_user if @current_user.present?

      return nil if api_token.blank?

      @current_user = User.find_by(email: api_token)
    end

    private

    def api_token
      request.env['HTTP_AUTHORIZATION'].to_s.split(' ').last
    end
  end
end
