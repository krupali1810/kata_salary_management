class SalaryCalculator
  def initialize(employee)
    @employee = employee
  end

  def call
    deduction = @employee.salary * 0.10
    net_salary = @employee.salary - deduction

    {
      gross_salary: @employee.salary.to_f,
      deduction: deduction.to_f,
      net_salary: net_salary.to_f
    }
  end
end
