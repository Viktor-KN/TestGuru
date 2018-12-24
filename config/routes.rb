Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'tests#index'

  resources :tests do
    resources :questions, except: %i[index], shallow: true do
      resources :answers, except: %i[index], shallow: true
    end

    member do
      post 'start'
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get 'result'
    end
  end
end
