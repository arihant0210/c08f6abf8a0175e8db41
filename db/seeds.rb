# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

channels = ["Aaj Tak", "Zee News", "Zee 24", "Sony", "Sony Max"]
minutes = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55]
channels.each do |channel|
	channel = Channel.find_or_create_by(name: channel)
	if channel.present?
		(1..5).to_a.each do |num|
			time = "#{rand(0...23)}:#{minutes[rand(0...(minutes.size))]}"
			show  = Show.create(name: "Show #{num}", channel_id: channel.id, time: time)
		end
	end
end
