require 'rails_helper'

RSpec.describe "questions/new", type: :view do
  before(:each) do
    assign(:question, Question.new(
      ballot: nil,
      question_type: "MyString",
      title: "MyString",
      description: "MyText",
      randomize_selection: false,
      voter_abstain: false
    ))
  end

  it "renders new question form" do
    render

    assert_select "form[action=?][method=?]", questions_path, "post" do

      assert_select "input[name=?]", "question[ballot_id]"

      assert_select "input[name=?]", "question[question_type]"

      assert_select "input[name=?]", "question[title]"

      assert_select "textarea[name=?]", "question[description]"

      assert_select "input[name=?]", "question[randomize_selection]"

      assert_select "input[name=?]", "question[voter_abstain]"
    end
  end
end
