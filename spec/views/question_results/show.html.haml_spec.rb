require 'rails_helper'

RSpec.describe "question_results/show", type: :view do
  before(:each) do
    @question_result = assign(:question_result, QuestionResult.create!(
      voter: nil,
      question: nil,
      content: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
  end
end
