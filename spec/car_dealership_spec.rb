require('rspec')
require('car_dealership')
require('vehicle')

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

  describe('#save') do
    it("will save new dealerships to an array") do
      test_dealership = Dealership.new("Bob's Used Cars")
      test_dealership.save()
      expect(Dealership.all()).to(eq([test_dealership]))
    end
  end

  describe('.clear') do
    it("will clear the array holding dealerships") do
      test_dealership = Dealership.new("Bob's Used Cars")
      test_dealership.save()
      expect(Dealership.clear()).to(eq([]))
    end
  end

  describe('.find') do
    it("will find the id of the dealership object in the dealership class") do
      test_dealership = Dealership.new("Bob's Used Cars")
      test_dealership.save()
      perferred_dealership = Dealership.new("E&J's on 82nd")
      perferred_dealership.save()
      expect(Dealership.find(1)).to(eq(test_dealership))
    end
  end

  describe('#add_vehicle') do
    it("will add vehicle to specific dealership") do
      test_dealership = Dealership.new("Bob's Used Cars")
      test_vehicle = Vehicle.new("Toyota", "Prius", 2000)
      test_dealership.add_vehicle(test_vehicle)
      expect(test_dealership.cars()).to(eq([test_vehicle]))
    end
  end
end
