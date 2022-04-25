require 'rails_helper'

RSpec.describe "voters/index", type: :view do
  before(:each) do
    assign(:voters, [
      Voter.create!(),
      Voter.create!()
    ])
  end

  it "renders a list of voters" do
    render
  end
end
