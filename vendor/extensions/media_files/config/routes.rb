Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :media_files do
    resources :media_files, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :media_files, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :media_files, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
