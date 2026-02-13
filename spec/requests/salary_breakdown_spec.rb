require 'rails_helper'

RSpec.describe "Salary Breakdown API", type: :request do
  describe "GET /employees/:id/salary_breakdown" do
    context "when employee is from India" do
      let!(:employee) do
        Employee.create!(
          full_name: "John Doe",
          job_title: "Developer",
          country: "India",
          salary: 50000
        )
      end

      it "applies 10% deduction" do
        get "/employees/#{employee.id}/salary_breakdown"

        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body)

        expect(json["gross_salary"]).to eq(50000.0)
        expect(json["deduction"]).to eq(5000.0)
        expect(json["net_salary"]).to eq(45000.0)
      end
    end

    context "when employee is from United States" do
      let!(:employee) do
        Employee.create!(
          full_name: "Jane Smith",
          job_title: "Engineer",
          country: "United States",
          salary: 50000
        )
      end

      it "applies 12% deduction" do
        get "/employees/#{employee.id}/salary_breakdown"

        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body)

        expect(json["gross_salary"]).to eq(50000.0)
        expect(json["deduction"]).to eq(6000.0)
        expect(json["net_salary"]).to eq(44000.0)
      end
    end

    context "when employee is from another country" do
      let!(:employee) do
        Employee.create!(
          full_name: "Rachana",
          job_title: "Software Craftperson",
          country: "Germany",
          salary: 50000
        )
      end

      it "applies no deduction" do
        get "/employees/#{employee.id}/salary_breakdown"

        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body)

        expect(json["gross_salary"]).to eq(50000.0)
        expect(json["deduction"]).to eq(0.0)
        expect(json["net_salary"]).to eq(50000.0)
      end
    end

    context "when employee does not exist" do
      it "returns 404 not found" do
        get "/employees/999999/salary_breakdown"

        expect(response).to have_http_status(:not_found)

        json = JSON.parse(response.body)
        expect(json["error"]).to eq("Record not found")
      end
    end
  end
end
