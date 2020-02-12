class FriendshipsController < ApplicationController
  def create
    friend = User.find_by(github_handle: friendship_params[:handle])
    friendship = current_user.friendships.new(friend_id: friend.id)
    if friendship.save
      flash[:success] = 'Added friend!'
    else
      flash[:error] = 'Unable to add friend. That user does not have a registered account with Turing Tutorials.'
    end
    redirect_to dashboard_path
  end

  private

  def friendship_params
    params.permit(:user_id, :handle)
  end
end
