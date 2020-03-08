module Api
  class ApiController < ApplicationController
    include Api::Response

    respond_to :json

    skip_before_action :verify_authenticity_token
    skip_before_action :authenticate_user!

    before_action :authenticate_client!

    def authenticate_client!
      return if current_user.present?

      error_response('Incorrect access token', :unauthorized, 'invalid_grant')
    end

    def current_user
      return @current_user if @current_user.present?

      return nil if basic_auth.blank?

      user = User.find_by(email: basic_auth[0])
      (@current_user = user) if user.valid_password?(basic_auth[1])
    end

    private

    # [email, password]
    def basic_auth
      @auth ||= ::Base64.decode64(request.authorization.split(' ', 2).last || '').split(/:/, 2)
    end
  end
end
