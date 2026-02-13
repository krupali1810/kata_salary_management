class Employee < ApplicationRecord
	validates :full_name, presence: true
	validates :job_title, presence: true
end
