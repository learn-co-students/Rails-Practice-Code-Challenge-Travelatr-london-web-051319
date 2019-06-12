Rails.application.routes.draw do
  resources :bloggers
  resources :destinations
  resources :posts do
    patch "like", on: :member
  end
end
