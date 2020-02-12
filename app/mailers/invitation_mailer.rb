class InvitationMailer < ApplicationMailer
  def invite(invitee_facade)
    @user = invitee_facade.user
    @invitee = invitee_facade.invitee
    mail(to: @invitee.email,
         subject: "#{@user.first_name} has invited you to join Turing Tutorials")
  end
end
