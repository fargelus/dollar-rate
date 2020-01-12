# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  get 'admin' => 'rates#new'
  resources :rates, only: %i[new create]
end
