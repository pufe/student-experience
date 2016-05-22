class WelcomeController < ApplicationController
  def index
  	@partial = params[:partial] || 'dashboard'
  end

  def trocar
  end
end
