# frozen_string_literal: true

Rails.application.routes.draw do
  
  resources :test, only: :show

  namespace :admin do
    resources :test, only: :show
  end

  namespace :static do
    resources :test, only: :show
  end
end
