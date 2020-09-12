class ScheduleShowWorker
	include Sidekiq::Worker
	include Sidekiq::Status::Worker

	def perform(show_id)
		show = Show.find_by(id: show_id)
		return unless  show.present?
		reminder_job_id = SendShowNotificationWorker.perform_at(show.time.to_time - 30.minutes, show.id)

		show.update_column(:reminder_job_id, reminder_job_id)
	end
end