class MembersController < ApplicationController
  before_action :authenticate_user!

  def show
    user = get_user_from_token
    render json: {
      message: 'you are in!!',
      user: user
    }
  end

  private

  def get_user_from_token
    auth_token = request.headers['Authorization'].split(' ')[1]
    jwt_payload = JWT.decode(auth_token, Rails.application.credentials.devise[:jwt_secret_key]).first
    user_id = jwt_payload['sub']
    User.find(user_id.to_s)
  end


end