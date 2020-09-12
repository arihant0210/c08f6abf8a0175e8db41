class Channel < ApplicationRecord
	has_many :shows, dependent: :destroy
end
