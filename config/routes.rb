Rails.application.routes.draw do
  resources :animals do
    member do
      put 'increment'
    end
  end

  #do
   # PUT "/animals", to: "count#{id}"
  #end
#end
  #If user sends GET request to '/animals' then call index method on controller
  # called AnimalsController
  #get "/animals", to: "animals#index"
  #get "/animals/:id", to: "animal#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
