class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate

  protected
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['WEB_APP_USERNAME'] && password == ENV['WEB_APP_PASSWORD']
    end
  end
end
