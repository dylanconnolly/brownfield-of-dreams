class GithubInvitee

  def invitee_info(user, handle)
    info = GithubService.new(user.github_token).invitee_handle(handle)
    Invitee.new(info)
  end
end
