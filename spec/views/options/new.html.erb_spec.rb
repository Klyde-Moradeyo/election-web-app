require 'rails_helper'

RSpec.describe "options/new", type: :view do
  before(:each) do
    assign(:option, Option.new(
      question: nil,
      ballot: nil,
      party: nil,
      title: "MyString",
      description: "MyText"
    ))
  end

  it "renders new option form" do
    render

    assert_select "form[action=?][method=?]", options_path, "post" do

      assert_select "input[name=?]", "option[question_id]"

      assert_select "input[name=?]", "option[ballot_id]"

      assert_select "input[name=?]", "option[party_id]"

      assert_select "input[name=?]", "option[title]"

      assert_select "textarea[name=?]", "option[description]"
    end
  end
end
