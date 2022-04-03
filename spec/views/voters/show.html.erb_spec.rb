require 'rails_helper'

RSpec.describe "voters/show", type: :view do
  before(:each) do
    @voter = assign(:voter, Voter.create!(
      user: nil,
      username: "Username",
      password: "Password",
      vote_weight: 2,
      store_voter: false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/false/)
  end
end
