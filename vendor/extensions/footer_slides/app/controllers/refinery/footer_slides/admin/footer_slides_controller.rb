module Refinery
  module FooterSlides
    module Admin
      class FooterSlidesController < ::Refinery::AdminController

        crudify :'refinery/footer_slides/footer_slide', :xhr_paging => true

      end
    end
  end
end
