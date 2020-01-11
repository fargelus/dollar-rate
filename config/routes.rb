# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'home#index'
  get 'admin' => 'rates#edit'
  resources :rates, only: :update
end
