Rails.application.routes.draw do
  get 'problem/show'
  get 'sources/show'
  get 'summary/show'
  get 'theory_chunks/show'
  get 'scenario/show'
  get 'lessons/index'
  get 'lessons/show'
  get 'device_users/send_message'
  get 'emails/create'
  get 'emails/update'
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: "subjects#index" 
  get '/:subject_slug/lessons', to: "lessons#index_by_subject", as: 'lessons' 
  get '/lesson/:lesson_slug', to: "lessons#show", as: 'lesson'
  get '/lesson/:lesson_slug/problem', to: "problem#show", as: 'problem'
  get '/lesson/:lesson_slug/theory/part-(:theory_id)', to: "theory_chunks#show", as: 'theory'
  get '/lesson/:lesson_slug/summary', to: "summary#show", as: 'summary'
end
