require 'rails_helper'

RSpec.describe "Employees API", type: :request do
  describe "POST /employees" do
    it "creates a new employee" do
      expect {
        post "/employees", params: {
          employee: {
            full_name: "John Doe",
            job_title: "Developer",
            country: "India",
            salary: 50000
          }
        }
      }.to change(Employee, :count).by(1)

      expect(response).to have_http_status(:created)
    end
  end

  describe "GET /employees" do
    it "returns all employees" do
      Employee.create!(
        full_name: "John Doe",
        job_title: "Developer",
        country: "India",
        salary: 50000
      )

      get "/employees"

      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).length).to eq(1)
    end
  end

end
