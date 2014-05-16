Ingamefame::Application.routes.draw do
  devise_for :users, :controllers => {registrations: 'registrations', sessions: "sessions"}
  resources :users do
    resources :channels, controller: 'users/channels'
  end

  get "channels/next" => "channels#next", as: "next_channel"
  root to: "home#index"
end
