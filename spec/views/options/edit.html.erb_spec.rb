require 'rails_helper'

RSpec.describe "options/edit", type: :view do
  before(:each) do
    @option = assign(:option, Option.create!(
      question: nil,
      ballot: nil,
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders the edit option form" do
    render

    assert_select "form[action=?][method=?]", option_path(@option), "post" do

      assert_select "input[name=?]", "option[question_id]"

      assert_select "input[name=?]", "option[ballot_id]"

      assert_select "input[name=?]", "option[title]"

      assert_select "textarea[name=?]", "option[description]"
    end
  end
end
