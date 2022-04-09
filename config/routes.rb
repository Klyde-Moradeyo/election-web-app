# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # resources
  resources :users
  resources :voters
  resources :stored_voters
  resources :permissions
  resources :ballots
  resources :partys
  resources :ballot_results
  resources :questions
  resources :question_results
  resources :options

  # Defines the root path route ("/")
  root "home#index"
end
