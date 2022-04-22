require 'rails_helper'

RSpec.describe "question_results/new", type: :view do
  before(:each) do
    assign(:question_result, QuestionResult.new(
      question: nil,
      ballot: nil,
      voter: nil,
      option: nil,
      content: "MyText"
    ))
  end

  it "renders new question_result form" do
    render

    assert_select "form[action=?][method=?]", question_results_path, "post" do

      assert_select "input[name=?]", "question_result[question_id]"

      assert_select "input[name=?]", "question_result[ballot_id]"

      assert_select "input[name=?]", "question_result[voter_id]"

      assert_select "input[name=?]", "question_result[option_id]"

      assert_select "textarea[name=?]", "question_result[content]"
    end
  end
end
