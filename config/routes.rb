Rails.application.routes.draw do
      resources :comments
      resources :issues, only: [:index, :show, :create, :updated, :destroy] do
        get 'comments', to: 'issues#issue_comments'
      end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
