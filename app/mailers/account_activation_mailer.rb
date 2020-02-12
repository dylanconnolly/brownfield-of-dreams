class AccountActivationMailer < ApplicationMailer
  def activate(user)
    @user = user
    @url = "/users/#{user.id}/activation"
    mail(to: user.email,
         subject: 'Please activate your Turing Tutorials account')
  end
end
