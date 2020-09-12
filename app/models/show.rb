class Show < ApplicationRecord
	belongs_to :channel
	has_many :favourite_shows
	has_many :users, through: :favourite_shows

	before_save :show_reminder, if: :time_changed?
	after_destroy :cancel_reminder, if: :reminder_job_id?

	def favourite_for(user)
		self.favourite_shows.find_by(user_id: user.id).present?
	end	

	def show_reminder
		cancel_reminder if reminder_job_id.present?
		self.reminder_job_id = ::SendShowNotificationWorker.perform_at(self.time.to_time - 30.minutes, self.id)
	end

	def cancel_reminder
		Sidekiq::Status.cancel self.reminder_job_id
	end
end
