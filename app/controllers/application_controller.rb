class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken

  def authenticate_api_key!
    header = request.headers['Authorization']
    token = header&.gsub('Bearer ', '')
    head :unauthorized if ENV['API_KEY'] != token
  end
end
