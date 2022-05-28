# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: "registrations" }

  # Defines the root path route ("/")
  root "home#coming_soon"

  get "/it" => "voter_sessions#entry"

  # resources
  resources :voters
  get "/voter/sign_in", to: "voters#sign_in"
  post "/voter/sign_in", to: "voters#sign_in"

  resources :home
  resources :voter_sessions
  resources :users do
    resources :ballots do
      get "/launch" => "ballots#launch"
      get "/results" => "ballots#results"
      get "/ballot_questions" => "ballots#questions"

      # Voter Sessions
      get "/lobby" => "voter_sessions#lobby"
      get "/voter/sign_out", to: "voter_sessions#sign_out"

      # Voter User
      resources :voters, shallow: true
      get "/voter_list" => "ballots#voters"

      # Ballot Results
      resources :ballot_results, shallow: true

      # Questions
      resources :questions, shallow: true do
        resources :options
        resources :question_results
        patch "/create_question_results", to: "questions#create_question_results", as: "create_question_results"
      end
    end
  end

  # letter opener web
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
