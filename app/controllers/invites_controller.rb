class InvitesController < ApplicationController
  def new; end

  def create
    invitee_info = InviteeFacade.new(current_user, params[:github_handle])
    if validate_email(invitee_info.invitee)
      InvitationMailer.invite(invitee_info).deliver_now
      flash[:success] = 'Successfully sent invite!'
      redirect_to dashboard_path
    else
      flash[:error] = "The Github user you selected
      doesn't have an email address associated with their account."
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def validate_email(invitee)
    invitee.email
  end
end
