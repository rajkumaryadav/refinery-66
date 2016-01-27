module Refinery
  module MediaFiles
    class MediaFile < Refinery::Core::BaseModel
      self.table_name = 'refinery_media_files'

      attr_accessible :title, :description, :video_url, :media_type, :audio1_id, :audio2_id, :images_0, :position

      acts_as_indexed :fields => [:title, :description, :video_url]

      validates :title, :presence => true, :uniqueness => true
	  belongs_to :image, :class_name => 'Image'
	  has_many_page_images
      
       belongs_to :audio1, :class_name => '::Refinery::Resource'

       belongs_to :audio2, :class_name => '::Refinery::Resource'
    end
  end
end
