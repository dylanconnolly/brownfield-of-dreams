class UsersController < ApplicationController
  def show
    render locals: {
      dashboard_data: UserDashboardFacade.new
    }
  end

  def new
    @user = User.new
  end

  def create
    user = User.create(user_params)
    if user.save
      AccountActivationMailer.activate(user).deliver_now
      session[:user_id] = user.id
      redirect_to dashboard_path
    else
      flash[:error] = 'Username already exists'
      render :new
    end
  end

  def edit
    user_info = request.env['omniauth.auth']
    current_user.update(
      github_token: user_info[:credentials][:token],
      github_handle: user_info[:extra][:raw_info][:login]
    )
    redirect_to dashboard_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :password)
  end
end
