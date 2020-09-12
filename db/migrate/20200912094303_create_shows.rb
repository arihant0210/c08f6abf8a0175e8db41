class CreateShows < ActiveRecord::Migration[6.0]
  def change
    create_table :shows do |t|
    	t.string :name
      t.string :time
      t.integer :channel_id
      t.timestamps
    end
  end
end
