require './lib/employee'

RSpec.describe Employee do
  let(:bobbi) { Employee.new ( {name: "Bobbi Jaeger", age: "30", salary: "$100000" } ) }

  describe "#initialize" do
    it "exists" do
      expect(bobbi).to be_an_instance_of(Employee)
    end
  end
end