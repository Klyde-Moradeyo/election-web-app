require 'rails_helper'

RSpec.describe "ballots/edit", type: :view do
  before(:each) do
    @ballot = assign(:ballot, Ballot.create!(
      user: nil,
      title: "MyString",
      description: "MyText",
      URL: "MyText",
      ballot_type: "MyString",
      weighted_voting: false,
      show_results: false
    ))
  end

  it "renders the edit ballot form" do
    render

    assert_select "form[action=?][method=?]", ballot_path(@ballot), "post" do

      assert_select "input[name=?]", "ballot[user_id]"

      assert_select "input[name=?]", "ballot[title]"

      assert_select "textarea[name=?]", "ballot[description]"

      assert_select "textarea[name=?]", "ballot[URL]"

      assert_select "input[name=?]", "ballot[ballot_type]"

      assert_select "input[name=?]", "ballot[weighted_voting]"

      assert_select "input[name=?]", "ballot[show_results]"
    end
  end
end
