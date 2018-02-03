Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  concern :paginatable do
    get '(page/:page/:limit)', action: :index, on: :collection, as: ''
  end

  resources :posts, concerns: :paginatable
  resources :authenticates, only: [] do
    collection do
      post 'login', to: 'authenticates#create'
      delete 'sign-out', to: 'authenticates#destroy'
    end
  end
end
