class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
  	current_user.role == "admin" ? dashboard_path : super
	end
end
