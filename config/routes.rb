Rails.application.routes.draw do
  root 'tests#index'

  resource :feedback, only: %i[new create]

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup, edit: '' },
                     controllers: { sessions: 'users/sessions' }

  resources :tests, only: %i[index] do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :gists, only: %i[index]
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: %i[index], shallow: true do
        resources :answers, except: %i[index], shallow: true
      end
    end
  end
end
