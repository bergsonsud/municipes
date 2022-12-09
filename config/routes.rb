# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'
  get '/healthcheck', to: ->(_env) { [200, { 'Content-Type' => 'text/plain' }, %w[ok]] }
  resources :municipes, except: [:destroy]
end
