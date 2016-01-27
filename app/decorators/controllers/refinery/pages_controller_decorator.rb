Refinery::PagesController.class_eval do
	layout :check_home_page
	
	private
		def check_home_page
			(action_name == "home") ? "application" : "application_inner"
		end
end
