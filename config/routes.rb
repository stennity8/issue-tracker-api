Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :comments
      resources :issues, only: [:index, :show, :create, :updated, :destroy] do
        get 'comments', to: 'issues#issue_comments'
      end
      get 'open_issues', to: 'issues#open_issues'
      get 'closed_issues', to: 'issues#closed_issues'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
