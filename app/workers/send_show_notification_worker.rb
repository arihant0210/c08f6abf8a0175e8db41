class SendShowNotificationWorker
	include Sidekiq::Worker
	include Sidekiq::Status::Worker

	def perform(show_id)
		show = Show.find_by(id: show_id)

		return unless  show.present?
		show.users.each do |user|
			ShowNotificationMailer.send_notification(user.id, show.id).deliver_now
		end
	end
end