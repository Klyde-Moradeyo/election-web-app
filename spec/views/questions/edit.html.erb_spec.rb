require 'rails_helper'

RSpec.describe "questions/edit", type: :view do
  before(:each) do
    @question = assign(:question, Question.create!(
      ballot: nil,
      question_type: "MyString",
      title: "MyString",
      description: "MyText",
      randomize_selection: false,
      voter_abstain: false
    ))
  end

  it "renders the edit question form" do
    render

    assert_select "form[action=?][method=?]", question_path(@question), "post" do

      assert_select "input[name=?]", "question[ballot_id]"

      assert_select "input[name=?]", "question[question_type]"

      assert_select "input[name=?]", "question[title]"

      assert_select "textarea[name=?]", "question[description]"

      assert_select "input[name=?]", "question[randomize_selection]"

      assert_select "input[name=?]", "question[voter_abstain]"
    end
  end
end
