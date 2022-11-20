class SplashesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @logo = 'logo.png'
  end
end
