Rails.application.routes.draw do
  get '/redirect', to: 'pages#redirect'
  root to: 'pages#home'
  devise_for :users,
             controllers: { sessions: "devise/passwordless/sessions" }
  devise_scope :user do
    get "/users/magic_link",
        to: "devise/passwordless/magic_links#show",
        as: "users_magic_link"
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
