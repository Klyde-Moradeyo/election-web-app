require 'rails_helper'

RSpec.describe "parties/new", type: :view do
  before(:each) do
    assign(:party, Party.new(
      ballot: nil,
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders new party form" do
    render

    assert_select "form[action=?][method=?]", parties_path, "post" do

      assert_select "input[name=?]", "party[ballot_id]"

      assert_select "input[name=?]", "party[title]"

      assert_select "textarea[name=?]", "party[description]"
    end
  end
end
