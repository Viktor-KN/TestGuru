Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'users/new'

  root 'tests#index'

  get :signup, to: 'users#new'

  resources :users, only: %i[create]

  resources :tests do
    resources :questions, except: %i[index], shallow: true do
      resources :answers, except: %i[index], shallow: true
    end

    post 'start', on: :member
  end

  resources :test_passages, only: %i[show update] do
    get 'result', on: :member
  end
end
