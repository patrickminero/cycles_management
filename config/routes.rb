Rails.application.routes.draw do
  root to: 'pages#home'
  resources :cycles
  # component routes
  get '/cycles/:id/new_components', to: 'cycles#new_component', as: 'new_component'
  post '/cycles/:id/new_components', to: 'cycles#add_components', as: 'add_components'
  patch 'cycles/:id/update_component', to: 'cycles#update_component', as: 'update_component'
  delete '/cycles/:id/delete_component', to: 'cycles#delete_component', as: 'delete_component'
  #subcomponent routes
  get '/cycles/:id/new_subcomponents', to: 'cycles#new_subcomponent', as: 'new_subcomponent'
  post '/cycles/:id/new_subcomponents', to: 'cycles#add_subcomponents', as: 'add_subcomponents'
  patch 'cycles/:id/update_subcomponent', to: 'cycles#update_subcomponent', as: 'update_subcomponent'
  delete '/cycles/:id/delete_subcomponent', to: 'cycles#delete_subcomponent', as: 'delete_subcomponent'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
