Rails.application.routes.draw do
  resources: animals

  #If user sends GET request to '/animals' then call index method on controller
  # called AnimalsController
  #get "/animals", to: "animals#index"
  #get "/animals/:id", to: "animal#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
