require 'rails_helper'

RSpec.describe "stored_voters/edit", type: :view do
  before(:each) do
    @stored_voter = assign(:stored_voter, StoredVoter.create!(
      user: nil,
      username: "MyString",
      password: "MyString",
      email: "MyString",
      vote_weight: 1
    ))
  end

  it "renders the edit stored_voter form" do
    render

    assert_select "form[action=?][method=?]", stored_voter_path(@stored_voter), "post" do

      assert_select "input[name=?]", "stored_voter[user_id]"

      assert_select "input[name=?]", "stored_voter[username]"

      assert_select "input[name=?]", "stored_voter[password]"

      assert_select "input[name=?]", "stored_voter[email]"

      assert_select "input[name=?]", "stored_voter[vote_weight]"
    end
  end
end
