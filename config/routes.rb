Rails.application.routes.draw do
  root to: 'tests#index'

  resources :tests do
    resources :questions, shallow: true
  end

  get '/questions/:id/delete', to: 'questions#destroy'
end
