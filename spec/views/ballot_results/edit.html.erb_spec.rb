require 'rails_helper'

RSpec.describe "ballot_results/edit", type: :view do
  before(:each) do
    @ballot_result = assign(:ballot_result, BallotResult.create!(
      ballot: nil,
      question_result: nil,
      content: "MyText"
    ))
  end

  it "renders the edit ballot_result form" do
    render

    assert_select "form[action=?][method=?]", ballot_result_path(@ballot_result), "post" do

      assert_select "input[name=?]", "ballot_result[ballot_id]"

      assert_select "input[name=?]", "ballot_result[question_result_id]"

      assert_select "textarea[name=?]", "ballot_result[content]"
    end
  end
end
