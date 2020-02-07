require 'rails_helper'

RSpec.describe Following, type: :model do
  it 'exists', :vcr do
    attributes = {
      login: 'BabsLabs',
      html_url: 'https://github.com/BabsLabs'
    }

    following = Following.new(attributes)
    expected_login = following.login
    expected_html_url = following.html_url

    expect(following).to be_a Following
    expect(following.login).to be(expected_login)
    expect(following.html_url).to be(expected_html_url)
  end
end
