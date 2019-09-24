class Note < ApplicationRecord
	belongs_to :appointment
	belongs_to :patient
	belongs_to :doctor
end
