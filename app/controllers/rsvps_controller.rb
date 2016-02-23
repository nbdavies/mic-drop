class RsvpsController < ApplicationController
  protect_from_forgery except: :create
  def new

  end

  def create
    rsvp = Rsvp.create(user_id: current_user.id, event_id: rsvp_params[:event_id])
    redirect_to '/'
  end

  def destroy
    Rsvp.delete(rsvp.id)
  end

  private
  def rsvp_params
    params.require(:rsvp).permit(:event_id)
  end

end
