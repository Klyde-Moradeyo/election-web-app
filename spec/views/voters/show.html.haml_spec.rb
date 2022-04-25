require 'rails_helper'

RSpec.describe "voters/show", type: :view do
  before(:each) do
    @voter = assign(:voter, Voter.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
