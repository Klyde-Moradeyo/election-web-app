require 'rails_helper'

RSpec.describe "permissions/edit", type: :view do
  before(:each) do
    @permission = assign(:permission, Permission.create!(
      user: nil,
      isAdmin: false
    ))
  end

  it "renders the edit permission form" do
    render

    assert_select "form[action=?][method=?]", permission_path(@permission), "post" do

      assert_select "input[name=?]", "permission[user_id]"

      assert_select "input[name=?]", "permission[isAdmin]"
    end
  end
end
