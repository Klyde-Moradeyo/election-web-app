require 'rails_helper'

RSpec.describe "parties/edit", type: :view do
  before(:each) do
    @party = assign(:party, Party.create!(
      ballot: nil,
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders the edit party form" do
    render

    assert_select "form[action=?][method=?]", party_path(@party), "post" do

      assert_select "input[name=?]", "party[ballot_id]"

      assert_select "input[name=?]", "party[title]"

      assert_select "textarea[name=?]", "party[description]"
    end
  end
end
