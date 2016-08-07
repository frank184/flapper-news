Rails.application.routes.draw do
  root to: 'application#angular'

  resources :posts, only: [:create, :index, :show], defaults: {format: 'json'} do
    resources :comments, only: [:show, :create] do
      member do
        put '/upvote' => 'comments#upvote'
      end
    end

    member do
      put '/upvote' => 'posts#upvote'
    end
  end

end
