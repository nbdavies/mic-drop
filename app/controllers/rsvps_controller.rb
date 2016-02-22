class RsvpsController < ApplicationController

  def new
    rsvp = Rsvp.create
  end

  def destroy
    Rsvp.delete(rsvp.id)
  end

end
