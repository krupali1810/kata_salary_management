require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is invalid without a full_name" do
    employee = Employee.new(job_title: "Dev", country: "India", salary: 50000)
    expect(employee).not_to be_valid
  end

  it "is invalid without a job_title" do
	  employee = Employee.new(
	    full_name: "John Doe",
	    country: "India",
	    salary: 50000
	  )

	  expect(employee).not_to be_valid
	end
end
