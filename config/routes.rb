Rails.application.routes.draw do
  namespace 'api' do
    scope 'v1' do
      resources :verification_links, only: [:create]
    end
  end
end
