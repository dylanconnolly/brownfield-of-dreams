require 'rails_helper'

RSpec.describe Follower, type: :model do
  it 'exists', :vcr do
    attributes = {
      login: 'mikecm1141',
      html_url: 'https://github.com/mikecm1141'
    }

    follower = Following.new(attributes)
    expected_login = follower.login
    expected_html_url = follower.html_url

    expect(follower).to be_a Following
    expect(follower.login).to be(expected_login)
    expect(follower.html_url).to be(expected_html_url)
  end
end
