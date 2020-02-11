require "rails_helper"

RSpec.describe InvitationMailer, type: :mailer do
  describe "invite email" do
    it "renders the headers", :vcr do
      user = create(:user, github_token: ENV['GITHUB_PERSONAL_TOKEN'])

      invitee_info = InviteeFacade.new(user, "octocat")
      mail = InvitationMailer.invite(invitee_info)

      expect(mail.subject).to eq("#{user.first_name} has invited you to join Turing Tutorials")
      expect(mail.to).to eq(["octocat@github.com"])
    end

    it "renders the body", :vcr do
      user = create(:user, github_token: ENV['GITHUB_PERSONAL_TOKEN'])

      invitee_info = InviteeFacade.new(user, "octocat")
      mail = InvitationMailer.invite(invitee_info)

      expect(mail.body.encoded).to include("Hello The Octocat")
      expect(mail.body.encoded).to include("#{user.first_name} has invited you to join Turing Tutorials")
      expect(mail.body.encoded).to have_link("here")
    end
  end
end
