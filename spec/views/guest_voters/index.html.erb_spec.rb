require 'rails_helper'

RSpec.describe "guest_voters/index", type: :view do
  before(:each) do
    assign(:guest_voters, [
      GuestVoter.create!(
        user: nil,
        username: "Username",
        password: "Password",
        vote_weight: 2
      ),
      GuestVoter.create!(
        user: nil,
        username: "Username",
        password: "Password",
        vote_weight: 2
      )
    ])
  end

  it "renders a list of guest_voters" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
