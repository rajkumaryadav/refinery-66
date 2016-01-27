module Refinery
  module MediaFiles
    class MediaFilesController < ::ApplicationController

      before_filter :find_all_media_files
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @media_file in the line below:
        present(@page)
      end

      def show
        @media_file = MediaFile.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @media_file in the line below:
        present(@page)
      end

    protected

      def find_all_media_files
        @media_files = MediaFile.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/media_files").first
      end

    end
  end
end
