Rails.application.routes.draw do
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :events
  root to: "events#index"
end
