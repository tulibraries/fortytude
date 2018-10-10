Rails.application.routes.draw do
  devise_for :accounts, controllers: { omniauth_callbacks: 'accounts/omniauth_callbacks' }
  namespace :admin do
    resources :accounts
    resources :alerts
    resources :buildings
    resources :groups
    resources :people
    resources :spaces
    resources :events
    resources :services

    root to: "people#index"
  end
  root  'application#index'
  resources :alerts, only: [:index, :show]
  resources :persons, only: [:index, :show], as: :people
  resources :spaces, only: [:index, :show]
  resources :buildings, only: [:index, :show]
  resources :groups, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :services, only: [:index, :show]
  resources :library_hours, only: [:index, :show], as: :hours, path: '/hours'

  controller :forms do 
    get 'forms/missing-book'  => :missing_book
    get 'forms/recall'  => :recall
    get 'forms/contact'  => :contact
    get 'forms/incident-report'  => :incident_report
    get 'forms/ask-scrc'  => :ask_scrc
  end

  controller :email_dispatcher do
    post  'mail/missing-book' => :missing_book
    post  'mail/recall' => :recall
    post  'mail/contact' => :contact
    post  'mail/incident-report' => :incident_report
    post  'mail/ask-scrc' => :ask_scrc
  end

end
