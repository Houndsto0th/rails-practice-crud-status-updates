Rails.application.routes.draw do
  resources :statusupdates
  root "statusupdates#index"
end
