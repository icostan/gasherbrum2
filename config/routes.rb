Rails.application.routes.draw do
  resources :providers
  resources :messages
  resources :forecasts
  resources :notifications
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'welcome#index'
  get 'privacy' => 'welcome#privacy'

  # twilio webhook
  post 'twilio/sms' => 'twilio#sms'
end
