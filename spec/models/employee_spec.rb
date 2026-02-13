require 'rails_helper'

RSpec.describe Employee, type: :model do
  it "is invalid without a full_name" do
    employee = Employee.new(job_title: "Dev", country: "India", salary: 50000)
    expect(employee).not_to be_valid
  end
end
