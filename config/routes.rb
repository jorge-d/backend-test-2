Rails.application.routes.draw do
  namespace :webhooks do
    get 'answer'
    get 'fallback'
    get 'hangup'
  end
end
