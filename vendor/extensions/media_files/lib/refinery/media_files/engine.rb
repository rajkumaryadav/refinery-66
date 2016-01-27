module Refinery
  module MediaFiles
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::MediaFiles

      engine_name :refinery_media_files

      initializer "register refinerycms_media_files plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "media_files"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.media_files_admin_media_files_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/media_files/media_file'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::MediaFiles)
      end
    end
  end
end
