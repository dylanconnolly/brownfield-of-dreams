class InviteeFacade
  attr_reader :user

  def initialize(user, handle)
    @user = user
    @handle = handle
  end

  def invitee
    GithubInvitee.new.invitee_info(@user, @handle)
  end
end
