class Song < ActiveRecord::Base
	has_many :adds
	validates :title, :artist, presence: true
	validates_length_of :title, :artist, minimum: 2
end
