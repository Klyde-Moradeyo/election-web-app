require 'rails_helper'

RSpec.describe "guest_voters/new", type: :view do
  before(:each) do
    assign(:guest_voter, GuestVoter.new(
      user: nil,
      username: "MyString",
      password: "MyString",
      vote_weight: 1
    ))
  end

  it "renders new guest_voter form" do
    render

    assert_select "form[action=?][method=?]", guest_voters_path, "post" do

      assert_select "input[name=?]", "guest_voter[user_id]"

      assert_select "input[name=?]", "guest_voter[username]"

      assert_select "input[name=?]", "guest_voter[password]"

      assert_select "input[name=?]", "guest_voter[vote_weight]"
    end
  end
end
