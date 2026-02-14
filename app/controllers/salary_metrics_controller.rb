class SalaryMetricsController < ApplicationController
  def index
    if params[:country]
      employees = Employee.where(country: params[:country])

      render json: {
        country: params[:country],
        min_salary: employees.minimum(:salary).to_f,
        max_salary: employees.maximum(:salary).to_f,
        average_salary: employees.average(:salary).to_f
      }, status: :ok
    else
      render json: { error: "Invalid parameters" }, status: :bad_request
    end
  end
end
