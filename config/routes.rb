# frozen_string_literal: true

Rails.application.routes.draw do

  require 'sidekiq/web'
  mount Sidekiq::Web, at: '/schedules', as: 'sidekiq_web'
  scope module: :api do
    namespace "v1" do
      # Documentation
      resources :docs, only: [:index]

      resources :authors
      get "authors/:id/books/", to: "authors#books"
    end
  end
end
