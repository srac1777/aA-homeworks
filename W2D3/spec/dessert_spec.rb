require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("brownie",50,"robb")}
  let("robb") {double("robb")}

  describe "#initialize" do

    it "sets a type" do
      expect(dessert.type).to eq('brownie')
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("brownie",'50',"Robb")}.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    before(:each) do
      dessert.add_ingredient("Eggs")
    end
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to include("Eggs")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ["Eggs", "chocolate", "sugar", "milk"]

      ingredients.each do |ingredient|
        dessert.add_ingredient(ingredient)
      end

      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).not_to eq(ingredients)
    end

  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(10)
      expect(dessert.quantity).to eq(40)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(60) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include(dessert.chef.titleize)
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      allow(dessert.chef).to receive(:bake).with(dessert)
      expect(dessert.chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
