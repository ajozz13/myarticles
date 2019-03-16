Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :authors
      resources :articles
    end
  end
end
