require './lib/budget'
require './lib/department'
require './lib/employee'

RSpec.describe Budget do
  let(:yearly_budget) { Budget.new(2023)}
  
  describe "#initialize" do
    it "exists" do
      expect(yearly_budget).to be_an_instance_of(Budget)
    end

    it "has readable attributes" do
      expect(yearly_budget.year).to eq(2023)
    end
  end
end