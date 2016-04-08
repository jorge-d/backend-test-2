Rails.application.routes.draw do
  namespace :webhooks do
    get 'answer'
    get 'fallback'
    get 'hangup'

    get 'voicemail'

    get 'after_dial'
    get 'action'
  end
end
