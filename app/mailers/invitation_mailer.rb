class InvitationMailer < ApplicationMailer

  def invite(user, invitee_facade)
    @user = user
    @invitee = invitee_facade.invitee
    mail(to: @invitee.email, subject: "#{user.handle} has invited you to join Turing Tutorials")
  end
end
