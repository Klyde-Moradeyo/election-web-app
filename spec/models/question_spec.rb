require 'rails_helper'

RSpec.describe Question, type: :model do

  let(:question) { build(:question) }

  it "is valid with valid attributes" do
     expect(question).to be_valid
  end

  it "is not valid without a title" do
    question.title = nil
    expect(question).to_not be_valid
  end

  it "is valid without a description" do
    question.description = nil
    expect(question).to be_valid
  end
  
  it "is not valid without a question_type" do
    question.question_type = nil
    expect(question).to_not be_valid
  end

  it "is valid with randomize_selection false"  do
    question.randomize_selection = 0
    expect(question).to be_valid
  end
  
  it "is valid with voter_abstain false"  do
    question.voter_abstain = 0
    expect(question).to be_valid
  end

  # Assosciations
  describe "Association" do
    it { should belong_to(:ballot) }
    it { should have_many(:options).without_validating_presence }
    # it { should have_many(:tags).through(:taggings) }
    # it { should have_many(:posts) }
  end
end
