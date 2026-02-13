class Employee < ApplicationRecord
	validates :full_name, presence: true
	validates :job_title, presence: true
	validates :country, presence: true
	validates :salary, presence: true
end
