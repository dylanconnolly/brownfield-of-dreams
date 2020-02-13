class GithubInvitee
  def invitee_info(user, handle)
    service = GithubService.new(user.github_token)
    info = service.invitee_handle(handle)
    Invitee.new(info)
  end
end
