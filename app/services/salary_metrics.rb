class SalaryMetrics
  def self.by_country(country)
    employees = Employee.by_country(country)

    {
      country: country,
      min_salary: employees.minimum(:salary).to_f,
      max_salary: employees.maximum(:salary).to_f,
      average_salary: employees.average(:salary).to_f
    }
  end

  def self.by_job_title(job_title)
    employees = Employee.by_job_title(job_title)

    {
      job_title: job_title,
      average_salary: employees.average(:salary).to_f
    }
  end
end
