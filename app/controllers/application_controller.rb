class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  skip_forgery_protection

  # AHOY MATEY
  after_action :track_action

  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end
  
  ###
end
