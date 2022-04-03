require 'rails_helper'

RSpec.describe "guest_voters/show", type: :view do
  before(:each) do
    @guest_voter = assign(:guest_voter, GuestVoter.create!(
      user: nil,
      username: "Username",
      password: "Password",
      vote_weight: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/2/)
  end
end
