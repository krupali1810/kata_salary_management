class SalaryMetricsController < ApplicationController
  def index
    if params[:country]
      render json: SalaryMetrics.by_country(params[:country]), status: :ok

    elsif params[:job_title]
      render json: SalaryMetrics.by_job_title(params[:job_title]), status: :ok
    else
      render json: { error: "Invalid parameters" }, status: :bad_request
    end
  end
end
