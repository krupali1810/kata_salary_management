class EmployeesController < ApplicationController
	before_action :set_employee, only: [:show, :update, :destroy]

	def create
    employee = Employee.new(employee_params)

    if employee.save
      render json: employee, status: :created
    else
      render json: { errors: employee.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
	  employees = Employee.all
	  render json: employees, status: :ok
	end

	def show
	  render json: @employee, status: :ok
	end

	def update
	  if @employee.update(employee_params)
	    render json: @employee, status: :ok
	  else
	    render json: { errors: @employee.errors.full_messages }, status: :unprocessable_entity
	  end
	end

	def destroy
	  @employee.destroy
	  head :no_content
	end

	def salary_breakdown
	  employee = Employee.find(params[:id])

	  deduction = employee.salary * 0.10
	  net_salary = employee.salary - deduction

	  render json: {
	    gross_salary: employee.salary.to_f,
	    deduction: deduction.to_f,
	    net_salary: net_salary.to_f
	  }, status: :ok
	end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:full_name, :job_title, :country, :salary)
  end
end
