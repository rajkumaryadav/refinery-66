module Refinery
  module FooterSlides
    class FooterSlide < Refinery::Core::BaseModel
      self.table_name = 'refinery_footer_slides'
       
      attr_accessible :title, :description, :image_id, :position

      acts_as_indexed :fields => [:title, :description]

      validates :title, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => 'Image'
	  has_many_page_images
    end
  end
end
