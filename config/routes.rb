Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }

  resource :profile, only: [ :show ]

  root to: 'welcome#index'
end
