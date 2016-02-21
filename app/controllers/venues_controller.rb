class VenuesController < ApplicationController
  def index
    render :json => current_user.venues
  end
end
