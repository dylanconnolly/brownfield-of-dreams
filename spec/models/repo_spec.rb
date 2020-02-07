require 'rails_helper'

RSpec.describe Repo, type: :model do
  it 'exists', :vcr do
    attributes = {
      name: 'activerecord-obstacle-course',
      html_url: 'https://github.com/dylanconnolly/activerecord-obstacle-course'
    }

    repo = Repo.new(attributes)
    expected_name = repo.name
    expected_html_url = repo.html_url

    expect(repo).to be_a Repo
    expect(repo.name).to be(expected_name)
    expect(repo.html_url).to be(expected_html_url)
  end
end
