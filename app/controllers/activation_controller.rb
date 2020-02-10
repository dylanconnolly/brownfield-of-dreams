class ActivationController < ApplicationController
  def show
    user = User.find(params[:user_id])
    user.update(activated: true)
    session[:user_id] = user.id
  end
end
