require 'rails_helper'

describe 'as a guest User' do
  it 'account appears as inactive after initial registration' do
    visit root_path

    click_on 'Register'

    fill_in :user_email, with: 'new_user@example.com'
    fill_in :user_first_name, with: 'New'
    fill_in :user_last_name, with: 'User'
    fill_in :user_password, with: 'password'
    fill_in :user_password_confirmation, with: 'password'

    click_on 'Create Account'

    expect(current_path).to eq('/dashboard')
    expect(page).to have_content('Logged in as New User')
    expect(page).to have_content('This account has not yet been activated. Please check your email.')
  end

  it 'can receive email to activate account after registering' do
    user = create(:user, email: 'new_user@example.com')

    AccountActivationMailer.activate(user).deliver_now

    result = ActionMailer::Base.deliveries.last

    assert(result)
    assert result.to.include? 'new_user@example.com'
    assert_equal 'Please activate your Turing Tutorials account', result.subject
  end

  it 'can click email invite link to activate account' do
    user = create(:user, email: 'new_user@example.com')

    visit "/users/#{user.id}/activation"

    expect(page).to have_content('Thank you! Your Account is now activated.')

    click_link('Go to Dashboard')
    expect(current_path).to eq(dashboard_path)
    expect(page).to have_content('Status: Active')
  end
end
