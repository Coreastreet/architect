Rails.application.routes.draw do
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :admin do 
    get 'login', to: "sessions#new", as: "login"
    post 'login', to: "sessions#create"
    delete 'logout', to: "sessions#destroy", as: "logout"

    resources :subjects, shallow: true, only: [:index, :create], param: "slug" do
        resources :lessons, only: [:new, :create, :index, :edit, :destroy, :update, :show], param: "lesson_slug" do
        end
    end

    resources :subjects, only: [:update, :destroy, :edit], param: "subject_slug"

    resources :lessons, shallow: true, param: "slug", only: [] do 
      resources :theory_chunks, only: [:index]
    end

  end
  # Defines the root path route ("/")
  root to: "subjects#index" 
  get '/:subject_slug/lessons', to: "lessons#index_by_subject", as: 'lessons' 
  get '/lesson/:lesson_slug', to: "lessons#show", as: 'lesson'
  get '/lesson/:lesson_slug/problem', to: "problem#show", as: 'problem'
  get '/lesson/:lesson_slug/theory/part-(:theory_id)', to: "theory_chunks#show", as: 'theory'
  get '/lesson/:lesson_slug/summary', to: "summary#show", as: 'summary'
end
