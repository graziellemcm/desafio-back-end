Rails.application.routes.draw do
  resources :cnabs, controller: "cna_bs"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
