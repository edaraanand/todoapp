Rails.application.routes.draw do
  devise_for :users
  # Default
  root to: "tasks#index"

  resources :tasks do
    resources :sub_tasks
  end
  
  post '/tasks/:id/sub_tasks' => 'sub_tasks#create', as: :create_sub_task
end
