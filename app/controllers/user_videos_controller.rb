class UserVideosController < ApplicationController
  def new; end

  def create
    if current_user
      bookmark_video
    else
      flash[:notice] = 'You must log in to bookmark videos.'
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def user_video_params
    params.permit(:user_id, :video_id)
  end

  def bookmark_video
    user_video = UserVideo.new(user_video_params)
    if current_user.user_videos.find_by(video_id: user_video.video_id)
      flash[:error] = 'Already in your bookmarks'
    elsif user_video.save
      flash[:success] = 'Bookmark added to your dashboard!'
    end
  end
end
