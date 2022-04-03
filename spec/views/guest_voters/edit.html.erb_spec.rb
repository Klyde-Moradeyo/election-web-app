require 'rails_helper'

RSpec.describe "guest_voters/edit", type: :view do
  before(:each) do
    @guest_voter = assign(:guest_voter, GuestVoter.create!(
      user: nil,
      username: "MyString",
      password: "MyString",
      vote_weight: 1
    ))
  end

  it "renders the edit guest_voter form" do
    render

    assert_select "form[action=?][method=?]", guest_voter_path(@guest_voter), "post" do

      assert_select "input[name=?]", "guest_voter[user_id]"

      assert_select "input[name=?]", "guest_voter[username]"

      assert_select "input[name=?]", "guest_voter[password]"

      assert_select "input[name=?]", "guest_voter[vote_weight]"
    end
  end
end
