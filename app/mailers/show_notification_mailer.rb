class ShowNotificationMailer < ApplicationMailer
	
	layout 'mailer'
	def send_notification(user_id, show_id)
		@user = User.find_by(id: user_id)
		@show = Show.find_by(id: show_id)
		mail(to: @user.email, subject: "Your Show Will Start at #{@show.time}")
	end
end
