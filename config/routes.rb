# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: "registrations" }

  # Defines the root path route ("/")
  root "home#coming_soon"

  get "/it" => "voter_sessions#entry"

  # resources
  resources :home
  resources :voter_sessions
  resources :voters
  resources :users do
    resources :ballots do
      get "/launch" => "ballots#launch"
      get "/waiting_room" => "voter_sessions#waiting_room"
      resources :voters, shallow: true
      resources :parties, shallow: true
      resources :ballot_results, shallow: true
      resources :questions, shallow: true do
        resources :options
        resources :question_results
      end
    end
  end

  # letter opener web
  mount LetterOpenerWeb::Engine, at: "/letter_opener"
end
