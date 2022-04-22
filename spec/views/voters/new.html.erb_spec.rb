require 'rails_helper'

RSpec.describe "voters/new", type: :view do
  before(:each) do
    assign(:voter, Voter.new(
      user: nil,
      username: "MyString",
      password: "MyString",
      email: "MyString",
      vote_weight: 1,
      store_voter: false
    ))
  end

  it "renders new voter form" do
    render

    assert_select "form[action=?][method=?]", voters_path, "post" do

      assert_select "input[name=?]", "voter[user_id]"

      assert_select "input[name=?]", "voter[username]"

      assert_select "input[name=?]", "voter[password]"

      assert_select "input[name=?]", "voter[email]"

      assert_select "input[name=?]", "voter[vote_weight]"

      assert_select "input[name=?]", "voter[store_voter]"
    end
  end
end
