require 'rails_helper'

RSpec.describe "stored_voters/show", type: :view do
  before(:each) do
    @stored_voter = assign(:stored_voter, StoredVoter.create!(
      user: nil,
      username: "Username",
      password: "Password",
      email: "Email",
      vote_weight: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/2/)
  end
end
