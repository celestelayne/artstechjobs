module SessionsHelper
	
	def log_in(user)
		session[:user_id] = user.id
		@current_user = user
	end

	def current_user
		return false if session[:user_id] == nil
		@current_user ||= User.find_by(id: session[:user_id])
	end

	def logged_in?
		if current_user == nil
			redirect_to new_session_path
		end
	end

	def logout
		@current_user = session[:user_id] = nil
	end

end
