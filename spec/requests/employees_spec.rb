require 'rails_helper'

RSpec.describe "Employees API", type: :request do

  let(:employee) do
    Employee.create!(
      full_name: "John Doe",
      job_title: "Developer",
      country: "India",
      salary: 50000
    )
  end

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

  describe "GET /employees/:id" do
    it "returns the employee" do
      get "/employees/#{employee.id}"

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)
      expect(json["id"]).to eq(employee.id)
      expect(json["full_name"]).to eq("John Doe")
    end
  end

  describe "PATCH /employees/:id" do
    it "updates the employee" do
      patch "/employees/#{employee.id}", params: {
        employee: { job_title: "Senior Developer" }
      }

      expect(response).to have_http_status(:ok)

      employee.reload
      expect(employee.job_title).to eq("Senior Developer")
    end
  end
end
