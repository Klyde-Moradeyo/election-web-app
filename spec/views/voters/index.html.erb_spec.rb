require 'rails_helper'

RSpec.describe "voters/index", type: :view do
  before(:each) do
    assign(:voters, [
      Voter.create!(
        user: nil,
        username: "Username",
        password: "Password",
        vote_weight: 2,
        store_voter: false
      ),
      Voter.create!(
        user: nil,
        username: "Username",
        password: "Password",
        vote_weight: 2,
        store_voter: false
      )
    ])
  end

  it "renders a list of voters" do
    render
    assert_select "tr>td", text: nil.to_s, count: 2
    assert_select "tr>td", text: "Username".to_s, count: 2
    assert_select "tr>td", text: "Password".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
