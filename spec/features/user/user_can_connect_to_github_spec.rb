require 'rails_helper'

describe 'A registered User' do
  it 'can connect to GitHub', :vcr do
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:github] = OmniAuth::AuthHash.new({
      provider: 'github',
      uid: '12345',
      credentials: {
        token: ENV['GITHUB_PERSONAL_TOKEN'],
        expires: false
      },
      extra: {
        raw_info: {
          login: 'github_handle'
        }
      }
    })

    user = create(:user)

    stub_user(user)

    visit dashboard_path

    click_button 'Connect to GitHub'

    expect(user.github_token).to eq(ENV['GITHUB_PERSONAL_TOKEN'])
    expect(current_path).to eq(dashboard_path)
  end
end
