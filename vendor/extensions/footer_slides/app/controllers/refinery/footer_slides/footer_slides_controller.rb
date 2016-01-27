module Refinery
  module FooterSlides
    class FooterSlidesController < ::ApplicationController

      before_filter :find_all_footer_slides
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @footer_slide in the line below:
        present(@page)
      end

      def show
        @footer_slide = FooterSlide.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @footer_slide in the line below:
        present(@page)
      end

    protected

      def find_all_footer_slides
        @footer_slides = FooterSlide.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/footer_slides").first
      end

    end
  end
end
