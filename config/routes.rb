Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'issues/open', to: 'issues#open_issues'
      get 'issues/closed', to: 'issues#closed_issues'
      resources :comments
      resources :issues, only: [:index, :show, :create, :updated, :destroy] do
        get 'comments', to: 'issues#issue_comments'
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
