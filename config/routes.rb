Rails.application.routes.draw do
  resources :calls, only: [:index]

  resources :users, only: [:index, :show, :edit, :update]

  namespace :webhooks do
    get 'answer'
    get 'fallback'
    get 'hangup'

    get 'voicemail'

    get 'after_dial'
    get 'action'
  end

  root 'calls#index'
end
