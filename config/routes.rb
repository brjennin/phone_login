Rails.application.routes.draw do
  namespace 'api' do
    scope 'v1' do
      resources :verification_links, only: [:create]
      post 'authenticate', to: 'authentication#authenticate'
    end
  end
end
