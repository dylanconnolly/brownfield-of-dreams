class UsersController < ApplicationController
  def show
    if current_user.github_token
    render locals: {
      repo_data: UserDashboardFacade.new.take_5_repos(current_user.github_token),
      followers_data: UserDashboardFacade.new.all_followers(current_user.github_token),
      following_data: UserDashboardFacade.new.all_followings(current_user.github_token)
    }
    end
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  def edit
    user_info = request.env['omniauth.auth']
    current_user.update(github_token: user_info["credentials"]["token"])
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
