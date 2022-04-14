# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' }

  # Defines the root path route ("/")
  root "home#index"

  # resources
  resources :home
  resources :users do
    resources :ballots
    resources :questions 
    resources :options
    resources :stored_voters
    # resources :stored_parties
    resources :parties
    resources :voters
    resources :ballot_results
    resources :question_results
  end
end
