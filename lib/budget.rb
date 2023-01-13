class Budget
  attr_reader :year,
              :departments
  def initialize(year)
    @year = year
    @departments = []
    @departments_under_500 = []
  end

  def add_department(department)
    @departments << department
  end

  def low_expense_departments
    departments.each do |department|
      if department.expenses <= 500
        @departments_under_500 << department
      end
    end
    return @departments_under_500
  end

  # def list_salaries
  #   employee_salaries = Hash.new { |hash, key| hash[key] = 0 }
  #   @departments.each do |department|
  #     require 'pry'; binding.pry
  #     employee_salaries[department.employees] << department.employees[salary]
  #   end
  #   return employee_salaries
  # end

  def list_salaries
    all_salaries = []
    @departments.each do |department|
      department.employees.each do |employee|
        all_salaries << employee.salary
      end
    end
    return all_salaries
  end
end


# yearly_budget.departments[0].employees[0].salary