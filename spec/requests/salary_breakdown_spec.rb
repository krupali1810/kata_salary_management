require 'rails_helper'

RSpec.describe "Salary Breakdown API", type: :request do
  describe "GET /employees/:id/salary_breakdown" do
    let!(:employee) do
      Employee.create!(
        full_name: "John Doe",
        job_title: "Developer",
        country: "India",
        salary: 50000
      )
    end

    it "calculates salary breakdown for India" do
      get "/employees/#{employee.id}/salary_breakdown"

      expect(response).to have_http_status(:ok)

      json = JSON.parse(response.body)

      expect(json["gross_salary"]).to eq(50000.0)
      expect(json["deduction"]).to eq(5000.0)   # 10%
      expect(json["net_salary"]).to eq(45000.0)
    end
  end
end
