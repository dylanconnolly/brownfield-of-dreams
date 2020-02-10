class Invitee
  attr_reader :handle, :name, :email

  def initialize(invitee_github_info)
    @handle = invitee_github_info[:login]
    @name = invitee_github_info[:name]
    @email = invitee_github_info[:email]
  end
end
