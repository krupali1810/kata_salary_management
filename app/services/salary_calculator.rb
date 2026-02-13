class SalaryCalculator
  DEDUCTION_RATES = {
    "India" => 0.10,
    "United States" => 0.12
  }.freeze

  def initialize(employee)
    @employee = employee
  end

  def call
    rate = DEDUCTION_RATES.fetch(@employee.country, 0.0)

    deduction = @employee.salary * rate
    net_salary = @employee.salary - deduction

    {
      gross_salary: @employee.salary.to_f,
      deduction: deduction.to_f,
      net_salary: net_salary.to_f
    }
  end
end
