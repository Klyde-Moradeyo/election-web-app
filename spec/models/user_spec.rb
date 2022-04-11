require 'rails_helper'

RSpec.describe User, type: :model do

  
  user = User.create(
    first_name: "first_name",
    last_name: "last_name",
    email: "email",
    username: "username",
    password: "password",
    # start_date: DateTime.now,
    # end_date: DateTime.now + 1.week,
  )
  permissions = Permission.new(
      user_id: user.id,
      isAdmin: false,
    )
  puts permissions
  puts user

  it "is valid with valid attributes" do
    expect(user).to be_valid
  end

  it "is not valid without a first_name" do
    user.first_name = nil
    expect(user).to_not be_valid
  end

  it "is not valid without a last_name" do
    user.last_name = nil
    expect(user).to_not be_valid
  end
  
  it "is not valid without a email" do
    user.email = nil
    expect(user).to_not be_valid
  end

  it "is not valid without a username"  do
    user.username = nil
    expect(user).to_not be_valid
  end
  
  it "is not valid without a password"  do
    user.password = nil
    expect(user).to_not be_valid
  end

  # Assosciations
  describe "Association" do
    it { should have_many(:voters).without_validating_presence }
    it { should have_many(:stored_voters).without_validating_presence }
    it { should have_many(:ballots).without_validating_presence }
    it { should have_one(:permissions) }
  end
end
