module ApplicationHelper

	def inquiry_object
		Refinery::Inquiries::Inquiry.new
	end
end
