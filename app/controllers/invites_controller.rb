class InvitesController < ApplicationController

  def new; end

  def create
    invitee_info = InviteeFacade.new(current_user, params[:github_handle])
    require "pry"; binding.pry
    if validate_email(invitee_info.invitee)
      InvitationMailer.invite(current_user, invitee_info)
      flash[:success] = "Successfully sent invite!"
    else
      flash[:error] = "The Github user you selected doesn't have an email address associated with their account."
    end
    redirect_to dashboard_path
  end

  private

  def validate_email(invitee)
    invitee.email
  end
end
