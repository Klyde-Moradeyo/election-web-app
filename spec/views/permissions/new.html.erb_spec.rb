require 'rails_helper'

RSpec.describe "permissions/new", type: :view do
  before(:each) do
    assign(:permission, Permission.new(
      user: nil,
      isAdmin: false
    ))
  end

  it "renders new permission form" do
    render

    assert_select "form[action=?][method=?]", permissions_path, "post" do

      assert_select "input[name=?]", "permission[user_id]"

      assert_select "input[name=?]", "permission[isAdmin]"
    end
  end
end
