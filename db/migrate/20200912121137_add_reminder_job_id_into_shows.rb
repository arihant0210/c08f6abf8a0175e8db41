class AddReminderJobIdIntoShows < ActiveRecord::Migration[6.0]
  def change
  	add_column :shows, :reminder_job_id, :string
  end
end
