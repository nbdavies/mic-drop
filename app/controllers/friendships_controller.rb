class FriendshipsController < ApplicationController
  def create

  end

  private
  def friendships_params
    params.require(:friendship).permit(:user_id, :friend_id)
  end
end
