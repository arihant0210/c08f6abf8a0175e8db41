class ScheduleShowWorker
	include Sidekiq::Worker

	def perform(show_id)
		show = Show.find_by(id: show_id)
		return unless  show.present?
		SendShowNotificationWorker.perform_at(show.time.to_time - 30.minutes, show.id)
	end
end