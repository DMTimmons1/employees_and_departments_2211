require './lib/budget'
require './lib/department'
require './lib/employee'

RSpec.describe Budget do
  let(:yearly_budget) { Budget.new(2023) }
  let(:customer_service) { Department.new("Customer Service") }
  let(:sales) { Department.new("Sales") }
  let(:human_resources) { Department.new("Sales") }
  let(:bobbi) { Employee.new ( { name: "Bobbi Jaeger", age: "30", salary: "$100000" } ) }
  let(:aaron) { Employee.new ( { name: "Aaron Tanaka", age: "25", salary: "90000" } ) }  
  
  describe "#initialize" do
    it "exists" do
      expect(yearly_budget).to be_an_instance_of(Budget)
    end

    it "has readable attributes" do
      expect(yearly_budget.year).to eq(2023)
    end
  end

  describe "#add department" do
    it "starts out with no departments" do
      expect(yearly_budget.departments).to eq([])
    end

    it "can add departments to the yearly budget" do 
      yearly_budget.add_department(customer_service)

      expect(yearly_budget.departments).to eq([customer_service])
    end
  end

  describe "#low_expense_departments" do
    it "shows all the departments with less than $500 in expenses" do
      yearly_budget.add_department(customer_service)
      yearly_budget.add_department(sales)
      yearly_budget.add_department(human_resources)

      customer_service.expense(250)
      sales.expense(775)
      human_resources.expense(100)

      expect(yearly_budget.low_expense_departments).to eq([customer_service, human_resources])
    end
  end

  describe "#list_salaries" do
    it "can list all of the employees' salaries" do
      yearly_budget.add_department(customer_service)
      
      customer_service.hire(bobbi)
      customer_service.hire(aaron)

      # expect(yearly_budget.list_salaries).to eq([100000, 90000])
      expect(yearly_budget.list_salaries).to eq({ bobbi.name => bobbi.salary, aaron.name => aaron.salary })
    end
  end
end