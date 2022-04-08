require 'rails_helper'

RSpec.describe "stored_voters/index", type: :view do
  before(:each) do
    assign(:stored_voters, [
      StoredVoter.create!(
        user: nil,
        username: "Username",
        password: "Password",
        email: "Email",
        vote_weight: 2
      ),
      StoredVoter.create!(
        user: nil,
        username: "Username",
        password: "Password",
        email: "Email",
        vote_weight: 2
      )
    ])
  end

  it "renders a list of stored_voters" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
    assert_select "tr>td", text: "Email".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
