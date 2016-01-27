# Open the Refinery::Page model for manipulation
Refinery::Inquiries::Inquiry.class_eval do
  attr_accessible :address, :city, :call_time, :state, :zip
  
  validates :message, presence: true, allow_nil: true, allow_blank: true
end
