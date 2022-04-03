require 'rails_helper'

RSpec.describe "voters/edit", type: :view do
  before(:each) do
    @voter = assign(:voter, Voter.create!(
      user: nil,
      username: "MyString",
      password: "MyString",
      vote_weight: 1,
      store_voter: false
    ))
  end

  it "renders the edit voter form" do
    render

    assert_select "form[action=?][method=?]", voter_path(@voter), "post" do

      assert_select "input[name=?]", "voter[user_id]"

      assert_select "input[name=?]", "voter[username]"

      assert_select "input[name=?]", "voter[password]"

      assert_select "input[name=?]", "voter[vote_weight]"

      assert_select "input[name=?]", "voter[store_voter]"
    end
  end
end
