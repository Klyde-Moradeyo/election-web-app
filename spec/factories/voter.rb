FactoryBot.define do
    factory :voter do
      ballot
      sequence(:username) { |n| "voter_#{n}" } 
      sequence(:email) { |n| "voter_#{n}@email.com" }  
    end
  end
  