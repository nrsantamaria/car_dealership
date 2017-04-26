require 'sinatra'
require 'sinatra/reloader'
require './lib/vehicle'
require 'pry'

also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
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
  erb(:success)
end

get('/vehicles/:id') do
  @vehicles = Vehicle.find(params.fetch("id").to_i())
  erb(:singular_vehicle_page)
end
