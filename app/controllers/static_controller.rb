class StaticController < ApplicationController
  skip_before_action(:authenticate_user!, { :only => [:index] })

  def index
  end
end
# What do you mean by static?
# Do you still need this?
