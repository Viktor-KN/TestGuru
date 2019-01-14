Rails.application.routes.draw do
  root 'tests#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout, sign_up: :signup }

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
