Ingamefame::Application.routes.draw do
  get "channels/next" => "channels#next", as: "next_channel"
  root to: "home#index"
end
