module Refinery
  module FooterSlides
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::FooterSlides

      engine_name :refinery_footer_slides

      initializer "register refinerycms_footer_slides plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "footer_slides"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.footer_slides_admin_footer_slides_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/footer_slides/footer_slide'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::FooterSlides)
      end
    end
  end
end
