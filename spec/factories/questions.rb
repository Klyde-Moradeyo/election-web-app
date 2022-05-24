FactoryBot.define do
  factory :question do
    ballot
    question_type { "Modified Borda Count" }
    sequence(:title) { |n| "Question_#{n}" }  
    description { "This a Test Question." }
    randomize_selection { 1 }
    voter_abstain { 1 }
  end
end
