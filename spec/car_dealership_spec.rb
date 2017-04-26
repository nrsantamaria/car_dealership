require('rspec')
require('car_dealership')

describe(Dealership) do
  before() do
    Dealership.clear()
  end

  describe('#name') do
    it("returns the name of the dealership") do
      test_dealership = Dealership.new("Bob's Used Cars")
      expect(test_dealership.name()).to(eq("Bob's Used Cars"))
    end
  end

  describe('#id') do
    it("returns the id of the dealership") do
      test_dealership = Dealership.new("Bob's Used Cars")
      expect(test_dealership.id()).to(eq(1))
    end
  end

  describe('#cars') do
    it("initially returns an empty array of cars for the dealership") do
      test_dealership = Dealership.new("Bob's Used Cars")
      expect(test_dealership.cars()).to(eq([]))
    end
  end

  describe('.all') do
    it("will potentially hold all saved dealerships but be empty at first") do
      test_dealership = Dealership.new("Bob's Used Cars")
      expect(Dealership.all()).to(eq([]))
    end
  end

  # describe('#save') do
  #   it("will save new dealerships to an array") do
  #     test_dealership = Dealership.new("Bob's Used Cars")
  #     expect(test_dealership.save()).to(eq(["Bob's Used Cars"]))
  #   end
  # end

  describe('.clear') do

  end

  describe('.find') do

  end
end
