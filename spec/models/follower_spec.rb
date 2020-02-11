require 'rails_helper'

RSpec.describe Follower, type: :model do
  it 'exists', :vcr do
    attributes = {
      github_handle: 'mikecm1141',
      html_url: 'https://github.com/mikecm1141'
    }

    follower = Following.new(attributes)
    expected_login = follower.github_handle
    expected_html_url = follower.html_url

    expect(follower).to be_a Following
    expect(follower.github_handle).to be(expected_login)
    expect(follower.html_url).to be(expected_html_url)
  end
end
