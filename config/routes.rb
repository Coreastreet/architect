Rails.application.routes.draw do
  namespace :admin do
    get 'theory_points/new'
  end
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :admin do 
    get 'login', to: "sessions#new", as: "login"
    post 'login', to: "sessions#create"
    delete 'logout', to: "sessions#destroy", as: "logout"

    resources :subjects, shallow: true, only: [:index, :create], param: "slug" do
        resources :lessons, only: [:create, :index, :edit, :destroy, :update, :show], param: "lesson_slug" do
        end
        resources :lessons, param: "slug" do 
            get "index_show" # to 'lessons#index_show' action.
        end
    end

    resources :subjects, only: [:update, :destroy, :edit], param: "subject_slug"

    resources :lessons, param: "slug", only: [] do 
      resources :lesson_pages, only: [:show, :edit, :update, :destroy, :create], param: "lesson_page_id", shallow: true
      resource :problem, only: [:show, :edit, :update], param: "problem_id"
      resource :summary, only: [:show, :edit, :update], param: "problem_id"
    end

    resources :lesson_pages, only: [], shallow: true do
      resources :theory_points, only: [:new, :create, :destroy], shallow: true
    end

    resources :summaries, only: [] do
      resources :alternatives, only: [:new, :create, :edit, :update, :show, :destroy]
    end
  end
  # Defines the root path route ("/")
  root to: "subjects#index" 
  get '/about', to: "pages#about", as: "about"
  get '/recruiters', to: "pages#recruiters", as: "recruiters"

  get '/:subject_slug/lessons', to: "lessons#index_by_subject", as: 'lessons' 
  get '/lesson/:lesson_slug', to: "lessons#show", as: 'lesson'
  get '/lesson/:lesson_slug/problem', to: "problem#show", as: 'problem'
  get '/lesson/:lesson_slug/part-(:lesson_page_id)', to: "lesson_pages#show", as: 'lesson_page'
  get '/lesson/:lesson_slug/summary', to: "summary#show", as: 'summary'
end
