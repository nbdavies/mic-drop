class RsvpsController < ApplicationController
  protect_from_forgery except: :create
  def new

  end

  def create
    rsvp = Rsvp.create(user_id: current_user.id, event_id: rsvp_params[:event_id])
    render :json => Event.find(rsvp_params[:event_id]).pin(current_user)
  end

  def destroy
    rsvp = Rsvp.find_by(event_id: rsvp_params[:event_id])
    rsvp.destroy
    render :json => Event.find(rsvp_params[:event_id]).pin(current_user)
  end

  private
  def rsvp_params
    params.require(:rsvp).permit(:event_id)
  end

end
