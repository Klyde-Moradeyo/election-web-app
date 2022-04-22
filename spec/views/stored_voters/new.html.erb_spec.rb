require 'rails_helper'

RSpec.describe "stored_voters/new", type: :view do
  before(:each) do
    assign(:stored_voter, StoredVoter.new(
      user: nil,
      username: "MyString",
      password: "MyString",
      email: "MyString",
      vote_weight: 1
    ))
  end

  it "renders new stored_voter form" do
    render

    assert_select "form[action=?][method=?]", stored_voters_path, "post" do

      assert_select "input[name=?]", "stored_voter[user_id]"

      assert_select "input[name=?]", "stored_voter[username]"

      assert_select "input[name=?]", "stored_voter[password]"

      assert_select "input[name=?]", "stored_voter[email]"

      assert_select "input[name=?]", "stored_voter[vote_weight]"
    end
  end
end
