require 'sinatra'
require 'sinatra/reloader'
require './lib/vehicle'
require './lib/car_dealership'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/dealerships/new') do
  erb(:dealerships_form)
end

get('/dealerships') do
  @dealerships = Dealerships.all()
  erb(:dealerships)
end

post('/dealerships') do
  name = params.fetch('name')
  Dealership.new(name).save()
  @dealerships = Dealership.all()
  erb(:success)
end

get('/vehicles/:id') do
  @vehicles = Vehicle.find(params.fetch("id").to_i())
  erb(:singular_vehicle_page)
end

get('/dealerships/:id') do
  @dealership = Dealership.find(params.fetch("id").to_i())
  erb(:dealership_vehicles_form)
end

get('/vehicles') do
  @vehicles = Vehicle.all
  erb(:vehicles_page)
end

get('/vehicles/new') do
  erb(:add_vehicle_page)
end

post('/vehicles') do
  make = params.fetch("make")
  model = params.fetch("model")
  year = params.fetch("year")
  vehicle = Vehicle.new(make, model, year)
  vehicle.save()
  @dealership = Dealership.find(params.fetch('dealership_id').to_i())
  @dealership.add_vehicle(@vehicle)
  erb(:success)
end
