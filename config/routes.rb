# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: { registrations: "registrations" }

  # Defines the root path route ("/")
  root "home#index"

  # resources
  resources :home
  resources :users do
    resources :stored_voters
    # resources :stored_parties
    resources :ballots do
      resources :parties, shallow: true
      resources :voters, shallow: true
      resources :ballot_results, shallow: true
      resources :questions, shallow: true do
        resources :options
        resources :question_results
      end
    end
  end
end
