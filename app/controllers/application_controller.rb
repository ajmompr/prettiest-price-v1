class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!
  skip_forgery_protection
end
