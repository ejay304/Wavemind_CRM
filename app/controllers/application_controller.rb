
class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	
	protect_from_forgery with: :exception

	before_filter :update_sanitized_params, if: :devise_controller?

	layout :layout


	#  method to sanitized params for devise user sign up
	def update_sanitized_params
		devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation, :name, :firstname, :phone, :fax, :function, :zip, :city, :country, :address)}
		devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :password_confirmation, :name, :firstname, :phone, :fax, :function, :zip, :city, :country, :address, :current_password)}
	end

	def after_sign_in_path_for(resource)
		logger.debug(resource.inspect)
		if resource.type == "Employee"
			"/projects"
		else
			"/companies/"+resource.company_id.to_s+"/contacts/"+ resource.id.to_s + "/myProjects"
		end
	end

	def current_user
	  if !current_employee.nil?
	    current_employee
	  elsif !current_contact.nil?
	    current_contact
	  end   
	end

	private

	def layout


		logger.debug "___________________________"
			logger.debug current_user.inspect
			logger.debug "___________________________"
		if devise_controller?
			case action_name
			when "edit","update"
				"application"
			else
				"login"
			end
		else
			if current_user.type == "Contact"
				"contact"
			else
				"application"
			end
		end
	end
end
