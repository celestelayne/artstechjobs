module UsersHelper
	def gravatar_url(user)
		stripped_email = user.email.strip
		downcased_email = stripped_email.downcase
		hash = Digest::MD5.hexdigest(downcased_email)
		"http://gravatar.com/avatar/#{hash}"
	end
end
