Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :footer_slides do
    resources :footer_slides, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :footer_slides, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :footer_slides, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
