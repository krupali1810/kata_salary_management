require "rails_helper"

RSpec.describe "Salary Metrics API", type: :request do
  describe "GET /salary_metrics" do
    before do
      [
        { full_name: "A", job_title: "Developer", country: "India", salary: 40000 },
        { full_name: "B", job_title: "QA",        country: "India", salary: 60000 },
        { full_name: "C", job_title: "Developer", country: "USA",   salary: 90000 }
      ].each do |attrs|
        Employee.create!(attrs)
      end
    end

    context "when filtering by country" do
      it "returns min, max and average salary for the country" do
        get "/salary_metrics", params: { country: "India" }

        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body)

        expect(json["country"]).to eq("India")
        expect(json["min_salary"]).to eq(40000.0)
        expect(json["max_salary"]).to eq(60000.0)
        expect(json["average_salary"]).to eq(50000.0)
      end
    end

    context "when filtering by job title" do
      it "returns average salary for the job title" do
        get "/salary_metrics", params: { job_title: "Developer" }

        expect(response).to have_http_status(:ok)

        json = JSON.parse(response.body)

        expect(json["job_title"]).to eq("Developer")
        expect(json["average_salary"]).to eq(65000.0)
      end
    end
  end
end
