module Refinery
  module MediaFiles
    module Admin
      class MediaFilesController < ::Refinery::AdminController

        crudify :'refinery/media_files/media_file', :xhr_paging => true

      end
    end
  end
end
