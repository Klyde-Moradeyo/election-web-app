require 'rails_helper'

RSpec.describe User, type: :model do

  x = Random.rand(11)
  subject {
    described_class.new(
      first_name: "first_name",
      last_name: "last_name",
      email: "email#{x}@email.com",
      username: "username",
      password: "password", 
      # start_date: DateTime.now,
      # end_date: DateTime.now + 1.week,
    )
  }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a first_name" do
    subject.first_name = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a last_name" do
    subject.last_name = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a email" do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a username"  do
    subject.username = nil
    expect(subject).to_not be_valid
  end
  
  it "is not valid without a password"  do
    subject.password = nil
    expect(subject).to_not be_valid
  end

  # Assosciations
  describe "Association" do
    it { should have_many(:stored_voters).without_validating_presence }
    it { should have_many(:ballots).without_validating_presence }
  end
end
