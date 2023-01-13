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
end