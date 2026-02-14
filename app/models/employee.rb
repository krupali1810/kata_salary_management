class Employee < ApplicationRecord
	#validations
	validates :full_name, presence: true
	validates :job_title, presence: true
	validates :country, presence: true
	validates :salary, presence: true
	validates :salary, presence: true,
                   numericality: { greater_than: 0 }

  #scope
  scope :by_country, ->(country) { where(country: country) }
  scope :by_job_title, ->(job_title) { where(job_title: job_title) }
end
