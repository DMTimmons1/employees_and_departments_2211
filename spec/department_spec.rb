require './lib/department'
require './lib/employee'

RSpec.describe Department do
  let(:customer_service) { Department.new("Customer Service") }

  describe "#initialize" do
    it "exists" do
      expect(customer_service).to be_an_instance_of(Department)
    end
  end
end